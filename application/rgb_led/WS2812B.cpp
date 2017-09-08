//
// Created by permal on 9/7/17.
//

#include <smooth/application/rgb_led/WS2812B.h>
#include <smooth/core/util/ByteSet.h>
#include <cstring>
#include "esp_log.h"

namespace smooth
{
    namespace application
    {
        namespace rgb_led
        {
            WS2812B::WS2812B(rmt_channel_t channel, gpio_num_t io_pin, uint16_t led_count)
                    : led_data(), channel(channel)
            {
/*                rmt_set_pin(channel, RMT_MODE_TX, io_pin);
                rmt_set_mem_block_num(channel, 1);
                rmt_set_clk_div(channel, clock_divider);
                rmt_set_tx_loop_mode(channel, false);
                rmt_set_tx_carrier(channel, false, 0, 0, RMT_CARRIER_LEVEL_LOW);
                rmt_set_idle_level(channel, false, RMT_IDLE_LEVEL_LOW);
                rmt_set_source_clk(channel, RMT_BASECLK_APB);
                //rmt_set_memory_owner(channel, RMT_MEM_OWNER_TX);
                //rmt_set_err_intr_en(channel, true);
                //rmt_set_mem_pd(channel, false);


                ESP_ERROR_CHECK(rmt_driver_install(channel, 0, 0));
*/

                rmt_config_t config;
                config.gpio_num = io_pin;
                config.rmt_mode = RMT_MODE_TX;
                config.channel = channel;
                config.clk_div = clock_divider;
                config.mem_block_num = 1;
                config.tx_config.loop_en = 0;
                config.tx_config.carrier_en = 0;
                config.tx_config.idle_output_en = 0;
                config.tx_config.idle_level = RMT_IDLE_LEVEL_LOW;
                config.tx_config.carrier_freq_hz = 0;
                config.tx_config.carrier_level = RMT_CARRIER_LEVEL_HIGH;
                config.tx_config.carrier_duty_percent = 0;


                ESP_ERROR_CHECK(rmt_config(&config));
                ESP_ERROR_CHECK(rmt_driver_install(channel, 0, 0));

                // Prepare high and low data
                low.level0 = 1;
                low.duration0 = get_rmt_duration(t0h);
                low.level1 = 0;
                low.duration1 = get_rmt_duration(t0l);

                hi.level0 = 1;
                hi.duration0 = get_rmt_duration(t1h);
                hi.level1 = 0;
                hi.duration1 = get_rmt_duration(t1l);

                reset.level0 = 0;
                reset.duration0 = get_rmt_duration(reset_time);
                reset.level1 = 0;
                reset.duration1 = 0;

                std::memset(&terminator, 0, sizeof(terminator));

                // Reserve space for bits_per_pixel for each LED + two for reset and RMT terminator.
                led_data.reserve(led_count * bits_per_pixel + 2);
                for (auto i = 0; i < led_count * bits_per_pixel + 2; ++i)
                {
                    led_data.push_back(reset);
                }
            }

            WS2812B::~WS2812B()
            {
                rmt_driver_uninstall(channel);
            }

            uint16_t WS2812B::get_rmt_duration(uint16_t duration_in_ns)
            {
                return static_cast<uint16_t>( duration_in_ns / (pulse_width * clock_divider));
            }

            void WS2812B::set_pixel(uint16_t ix, uint8_t red, uint8_t green, uint8_t blue)
            {
                if (ix <= led_data.size() - bits_per_pixel)
                {
                    auto pixel = led_data.begin() + ix * bits_per_pixel;

                    ESP_LOGV("G", "%d, %x", ix * bits_per_pixel, green);
                    add_color(pixel, green);
                    ESP_LOGV("R", "%d, %x", ix * bits_per_pixel, red);
                    add_color(pixel, red);
                    ESP_LOGV("B", "%d, %x", ix * bits_per_pixel, blue);
                    add_color(pixel, blue);
                }
            }

            void WS2812B::add_color(std::vector<rmt_item32_t>::iterator& pixel, uint8_t color)
            {
                core::util::ByteSet b(color);
                int bit = 7;

                while (bit >= 0 && pixel != led_data.end())
                {
                    *pixel = b.test(bit) ? hi : low;
                    ESP_LOGV("P", "%s", (b.test(bit) ? "hi" : "low"));
                    bit--;
                    pixel++;
                }
            }

            void WS2812B::apply()
            {
                ESP_LOGV("Applying", "Applying %d", led_data.size());
                led_data[led_data.size() - 2] = reset;
                led_data[led_data.size() - 1] = terminator;
                rmt_write_items(channel, led_data.data(), led_data.size(), true);
                ESP_LOGV("Applying", "Done");
            }
        }
    }
}