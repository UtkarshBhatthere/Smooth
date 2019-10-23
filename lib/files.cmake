set(SMOOTH_LIB_ROOT ${CMAKE_CURRENT_LIST_DIR})

set(smooth_dir ${CMAKE_CURRENT_LIST_DIR}/smooth)
set(smooth_inc_dir ${CMAKE_CURRENT_LIST_DIR}/smooth/include/smooth)

set(SMOOTH_SOURCES
        ${smooth_dir}/application/hash/base64.cpp
        ${smooth_dir}/application/hash/sha.cpp
        ${smooth_dir}/application/io/i2c/ADS1115.cpp
        ${smooth_dir}/application/io/i2c/BME280.cpp
        ${smooth_dir}/application/io/i2c/MCP23017.cpp
        ${smooth_dir}/application/io/i2c/MCP23017.cpp
        ${smooth_dir}/application/io/wiegand/Wiegand.cpp
        ${smooth_dir}/application/network/http/HTTPProtocol.cpp
        ${smooth_dir}/application/network/http/HTTPServerClient.cpp
        ${smooth_dir}/application/network/http/http_utils.cpp
        ${smooth_dir}/application/network/http/regular/HTTPHeaderDef.cpp
        ${smooth_dir}/application/network/http/regular/HTTPPacket.cpp
        ${smooth_dir}/application/network/http/regular/MIMEParser.cpp
        ${smooth_dir}/application/network/http/regular/RegularHTTPProtocol.cpp
        ${smooth_dir}/application/network/http/regular/responses/ErrorResponse.cpp
        ${smooth_dir}/application/network/http/regular/responses/FileContentResponse.cpp
        ${smooth_dir}/application/network/http/regular/responses/HeaderOnlyResponse.cpp
        ${smooth_dir}/application/network/http/regular/responses/StringResponse.cpp
        ${smooth_dir}/application/network/http/regular/TemplateProcessor.cpp
        ${smooth_dir}/application/network/http/URLEncoding.cpp
        ${smooth_dir}/application/network/http/websocket/responses/WSResponse.cpp
        ${smooth_dir}/application/network/http/websocket/WebsocketProtocol.cpp
        ${smooth_dir}/application/network/http/websocket/WebSocketServer.cpp
        ${smooth_dir}/application/network/mqtt/MqttClient.cpp
        ${smooth_dir}/application/network/mqtt/packet/ConnAck.cpp
        ${smooth_dir}/application/network/mqtt/packet/Connect.cpp
        ${smooth_dir}/application/network/mqtt/packet/Disconnect.cpp
        ${smooth_dir}/application/network/mqtt/packet/MQTTPacket.cpp
        ${smooth_dir}/application/network/mqtt/packet/MQTTProtocol.cpp
        ${smooth_dir}/application/network/mqtt/packet/MQTTProtocolDefinitions.cpp
        ${smooth_dir}/application/network/mqtt/packet/PacketDecoder.cpp
        ${smooth_dir}/application/network/mqtt/packet/PacketIdentifierFactory.cpp
        ${smooth_dir}/application/network/mqtt/packet/PingReq.cpp
        ${smooth_dir}/application/network/mqtt/packet/PingResp.cpp
        ${smooth_dir}/application/network/mqtt/packet/PubAck.cpp
        ${smooth_dir}/application/network/mqtt/packet/PubComp.cpp
        ${smooth_dir}/application/network/mqtt/packet/Publish.cpp
        ${smooth_dir}/application/network/mqtt/packet/PubRec.cpp
        ${smooth_dir}/application/network/mqtt/packet/PubRel.cpp
        ${smooth_dir}/application/network/mqtt/packet/SubAck.cpp
        ${smooth_dir}/application/network/mqtt/packet/Subscribe.cpp
        ${smooth_dir}/application/network/mqtt/packet/UnsubAck.cpp
        ${smooth_dir}/application/network/mqtt/packet/Unsubscribe.cpp
        ${smooth_dir}/application/network/mqtt/Publication.cpp
        ${smooth_dir}/application/network/mqtt/state/ConnectedState.cpp
        ${smooth_dir}/application/network/mqtt/state/ConnectToBrokerState.cpp
        ${smooth_dir}/application/network/mqtt/state/DisconnectedState.cpp
        ${smooth_dir}/application/network/mqtt/state/DisconnectState.cpp
        ${smooth_dir}/application/network/mqtt/state/MQTTBaseState.cpp
        ${smooth_dir}/application/network/mqtt/state/RunState.cpp
        ${smooth_dir}/application/network/mqtt/Subscription.cpp
        ${smooth_dir}/application/security/PasswordHash.cpp
        ${smooth_dir}/core/Application.cpp
        ${smooth_dir}/core/filesystem/File.cpp
        ${smooth_dir}/core/filesystem/filesystem.cpp
        ${smooth_dir}/core/filesystem/FSLock.cpp
        ${smooth_dir}/core/filesystem/MMCSDCard.cpp
        ${smooth_dir}/core/filesystem/Path.cpp
        ${smooth_dir}/core/filesystem/SDCard.cpp
        ${smooth_dir}/core/filesystem/SPIFlash.cpp
        ${smooth_dir}/core/filesystem/SPISDCard.cpp
        ${smooth_dir}/core/io/i2c/I2CCommandLink.cpp
        ${smooth_dir}/core/io/i2c/I2CMasterDevice.cpp
        ${smooth_dir}/core/io/i2c/Master.cpp
        ${smooth_dir}/core/io/Input.cpp
        ${smooth_dir}/core/io/InterruptInput.cpp
        ${smooth_dir}/core/io/InterruptInputCB.cpp
        ${smooth_dir}/core/io/Output.cpp
        ${smooth_dir}/core/ipc/QueueNotification.cpp
        ${smooth_dir}/core/json/JsonFile.cpp
        ${smooth_dir}/core/logging/log.cpp
        ${smooth_dir}/core/network/CommonSocket.cpp
        ${smooth_dir}/core/network/IPv4.cpp
        ${smooth_dir}/core/network/IPv6.cpp
        ${smooth_dir}/core/network/MbedTLSContext.cpp
        ${smooth_dir}/core/network/SocketDispatcher.cpp
        ${smooth_dir}/core/network/Wifi.cpp
        ${smooth_dir}/core/sntp/Sntp.cpp
        ${smooth_dir}/core/SystemStatistics.cpp
        ${smooth_dir}/core/Task.cpp
        ${smooth_dir}/core/timer/ElapsedTime.cpp
        ${smooth_dir}/core/timer/Timer.cpp
        ${smooth_dir}/core/timer/TimerService.cpp
        ${smooth_dir}/core/util/string_util.cpp
        ${smooth_inc_dir}/application/io/i2c/ADS1115.h
        ${smooth_inc_dir}/application/io/i2c/MCP23017.h
        ${smooth_inc_dir}/application/network/http/HTTPProtocol.h
        ${smooth_inc_dir}/application/network/http/HTTPServer.h
        ${smooth_inc_dir}/application/network/http/HTTPServerClient.h
        ${smooth_inc_dir}/application/network/http/HTTPServerConfig.h
        ${smooth_inc_dir}/application/network/http/http_utils.h
        ${smooth_inc_dir}/application/network/http/IResponseOperation.h
        ${smooth_inc_dir}/application/network/http/regular/ITemplateDataRetriever.h
        ${smooth_inc_dir}/application/network/http/regular/RegularHTTPProtocol.h
        ${smooth_inc_dir}/application/network/http/regular/responses/ErrorResponse.h
        ${smooth_inc_dir}/application/network/http/regular/responses/FileContentResponse.h
        ${smooth_inc_dir}/application/network/http/regular/responses/StringResponse.h
        ${smooth_inc_dir}/application/network/http/regular/TemplateProcessor.h
        ${smooth_inc_dir}/application/network/http/URLEncoding.h
        ${smooth_inc_dir}/application/network/http/websocket/WebsocketProtocol.h
        ${smooth_inc_dir}/application/network/http/websocket/WebsocketServer.h
        ${smooth_inc_dir}/application/network/mqtt/event/BaseEvent.h
        ${smooth_inc_dir}/application/network/mqtt/event/ConnectEvent.h
        ${smooth_inc_dir}/application/network/mqtt/event/DisconnectEvent.h
        ${smooth_inc_dir}/application/network/mqtt/IMqttClient.h
        ${smooth_inc_dir}/application/network/mqtt/InFlight.h
        ${smooth_inc_dir}/application/network/mqtt/Logging.h
        ${smooth_inc_dir}/application/network/mqtt/MqttClient.h
        ${smooth_inc_dir}/application/network/mqtt/MQTTProtocolDefinitions.h
        ${smooth_inc_dir}/application/network/mqtt/packet/ConnAck.h
        ${smooth_inc_dir}/application/network/mqtt/packet/Connect.h
        ${smooth_inc_dir}/application/network/mqtt/packet/Disconnect.h
        ${smooth_inc_dir}/application/network/mqtt/packet/IPacketReceiver.h
        ${smooth_inc_dir}/application/network/mqtt/packet/MQTTPacket.h
        ${smooth_inc_dir}/application/network/mqtt/packet/MQTTProtocol.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PacketDecoder.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PacketIdentifierFactory.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PingReq.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PingResp.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PubAck.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PubComp.h
        ${smooth_inc_dir}/application/network/mqtt/packet/Publish.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PubRec.h
        ${smooth_inc_dir}/application/network/mqtt/packet/PubRel.h
        ${smooth_inc_dir}/application/network/mqtt/packet/SubAck.h
        ${smooth_inc_dir}/application/network/mqtt/packet/Subscribe.h
        ${smooth_inc_dir}/application/network/mqtt/packet/UnsubAck.h
        ${smooth_inc_dir}/application/network/mqtt/packet/Unsubscribe.h
        ${smooth_inc_dir}/application/network/mqtt/Publication.h
        ${smooth_inc_dir}/application/network/mqtt/state/ConnectedState.h
        ${smooth_inc_dir}/application/network/mqtt/state/ConnectToBrokerState.h
        ${smooth_inc_dir}/application/network/mqtt/state/DisconnectedState.h
        ${smooth_inc_dir}/application/network/mqtt/state/DisconnectState.h
        ${smooth_inc_dir}/application/network/mqtt/state/IdleState.h
        ${smooth_inc_dir}/application/network/mqtt/state/MQTTBaseState.h
        ${smooth_inc_dir}/application/network/mqtt/state/MqttFsmConstants.h
        ${smooth_inc_dir}/application/network/mqtt/state/MqttFSM.h
        ${smooth_inc_dir}/application/network/mqtt/state/RunState.h
        ${smooth_inc_dir}/application/network/mqtt/state/StartupState.h
        ${smooth_inc_dir}/application/network/mqtt/Subscription.h
        ${smooth_inc_dir}/application/security/PasswordHash.h
        ${smooth_inc_dir}/core/filesystem/MMCSDCard.h
        ${smooth_inc_dir}/core/filesystem/MountPoint.h
        ${smooth_inc_dir}/core/filesystem/Path.h
        ${smooth_inc_dir}/core/filesystem/SDCard.h
        ${smooth_inc_dir}/core/filesystem/SPIFlash.h
        ${smooth_inc_dir}/core/filesystem/SPISDCard.h
        ${smooth_inc_dir}/core/io/i2c/I2CCommandLink.h
        ${smooth_inc_dir}/core/io/i2c/I2CMasterDevice.h
        ${smooth_inc_dir}/core/io/i2c/Master.h
        ${smooth_inc_dir}/core/io/Input.h
        ${smooth_inc_dir}/core/io/Input.h
        ${smooth_inc_dir}/core/io/InterruptInput.h
        ${smooth_inc_dir}/core/io/InterruptInputCB.h
        ${smooth_inc_dir}/core/io/Output.h
        ${smooth_inc_dir}/core/network/Wifi.h
        ${smooth_inc_dir}/core/sntp/Sntp.h
        ${smooth_inc_dir}/core/sntp/TimeSyncEvent.h
        ${smooth_inc_dir}/core/SystemStatistics.h
        )



