package org.kosta.myproject.config;

import java.util.Arrays;
import java.util.List;

import org.kosta.myproject.handler.ReplyEchoHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new ReplyEchoHandler(), "/replyEcho").setAllowedOrigins("*");
	}

	private static final List<String> URL_PATTERNS = Arrays.asList("/async/*", "/board", "/user","/*");  //인터셉터가 동작 해야 될 요청 주소 mapping 목록
	
}

