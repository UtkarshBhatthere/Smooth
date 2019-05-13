#include <smooth/application/network/http/http_utils.h>

#include <array>
#include <sstream>
#include <iomanip>

using namespace std::chrono;

namespace smooth::application::network::http::utils
{
    static const std::array<const char*, 7> day{"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
    static const std::array<const char*, 12> month{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                                                   "Nov", "Dec"};

    std::string format_last_modified(const time_t& t)
    {
        tm time{};
        gmtime_r(&t, &time);
        std::stringstream ss;

        // https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Last-Modified
        // GMT == UTC and the time read from disc is in UTC so no need to convert between timezones.
        // <day-name>, <day> <month> <year> <hour>:<minute>:<second> GMT
        ss << day[static_cast<decltype(day)::size_type>(time.tm_wday)];
        ss << ", " << std::setfill('0') << std::setw(2) << time.tm_mday;
        ss << " " << month[static_cast<decltype(month)::size_type>(time.tm_mon)];
        ss << " " << time.tm_year + 1900;
        ss << " " << std::setfill('0') << std::setw(2) << time.tm_hour;
        ss << ":" << std::setfill('0') << std::setw(2) << time.tm_min;
        ss << ":" << std::setfill('0') << std::setw(2) << time.tm_sec;
        ss << " GMT";

        return ss.str();
    }

    std::chrono::system_clock::time_point parse_http_time(const std::string& t)
    {
        tm time{};
        std::istringstream ss(t);
        ss.imbue(std::locale("en_US.utf-8"));

        system_clock::time_point res{};

        ss >> std::get_time(&time, "%a, %d %b %Y %H:%M:%S GMT");
        if(ss.fail())
        {
            res = system_clock::time_point::min();
        }
        else
        {
            time.tm_isdst = 0;
            time_t time_to_use = timegm(&time);
            res = system_clock::from_time_t(time_to_use);
        }

        return res;
    }

    std::string get_content_type(const smooth::core::filesystem::Path& path)
    {
        // https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types
        const auto& ext = path.extension();
        if (ext == ".jpeg")
        {
            return "image/jpeg";
        }
        else if (ext == ".html")
        {
            return "text/html";
        }
        return "application/octet-stream";
    }
}