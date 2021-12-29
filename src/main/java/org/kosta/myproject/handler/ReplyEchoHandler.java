package org.kosta.myproject.handler;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	private Authentication authentication;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) {// 웹소켓이 연결되면 호출되는 함수
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);// 로그인되어있으면 유저아이디, 로그인 아니면 세션아이디
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println("handleTextMessage:" + session + " : " + message);
		String senderId = getId(session);
//		 protocol: cmd,댓글작성자,게시글작성자,bno(게시글번호) (ex: reply,user2,user1,234)
		String msg = message.getPayload();
		
		if ((msg)!=null) {
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String postId = strs[3];

				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);// 게시글 작성자가 있으면
				if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + "<a href='/board/" + postId + "'>"
							+ postId + "</a>번 게시글에 댓글을 달았습니다!");
					boardWriterSession.sendMessage(tmpMsg);
					System.out.println("메세지에룔"+tmpMsg);
				}
			}
		}
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Principal loginUser = session.getPrincipal();// 로그인유저는 http세션에 겟해서 세션네임즈.로그인에 세션에 넣어놓음(언제?)유저로
																	// 캐스팅해놓는다
		if (null == loginUser) {
			System.out.println("getId null입니다"+ session);// 로그인유저가 없다면 웹소켓세션에 아이디를 보내고
			return session.getId();
		} else {
			return loginUser.toString().split(", ")[3].substring(9);
			
//			return ((MemberDTO) loginUser).getEmail();// 있다면 아이디를 가져온다
		}
	}
//		MemberDTO userDetails = (MemberDTO) session.getPrincipal();
//		String loginUser = userDetails.getNickname();
////		MemberDTO loginUser = (MemberDTO)httpSession.get(SessionNames.LOGIN);//로그인유저는 http세션에 겟해서 세션네임즈.로그인에 세션에 넣어놓음(언제?)유저로 캐스팅해놓는다
//		if (null == loginUser)// 로그인유저가 없다면 웹소켓세션에 아이디를 보내고
//			return session.getId();
//		else
//			return userDetails.getEmail();// 있다면 아이디를 가져온다
//	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished:" + session + ":" + status);
	}

	public Authentication getAuthentication() {
		return authentication;
	}

	public void setAuthentication(Authentication authentication) {
		this.authentication = authentication;
	}
}
