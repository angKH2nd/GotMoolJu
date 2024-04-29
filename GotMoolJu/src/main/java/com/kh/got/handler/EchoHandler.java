package com.kh.got.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<>();
//	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished" +session);
		sessions.add(session);
//		String senderId = getId(session);
//		userSessions.put(senderId, session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage" +session + ":" + message);
		String senderId = session.getId();
		for (WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
		}
		
	}	
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			System.out.println("afterConnectionEstablished" + session + ":" + status);
		}
		//protocol: qna작성자,댓글 작성자, bno(reply, user1,user234)
//		String msg = message.getPayload();
//		if (StringUtils.isNotEmpty(msg)) {
//			String[] strs = msg.split(",");
//			if(strs !=null && strs.length == 4) {
//			String cms = strs[0];
//			String replyWriter = strs[1];
//			String boardWriter = strs[2];
//			String bno = strs[3];
//			
//			WebSocketSession qnaWriterSession = userSessions.get(qnaWriterSession);
//		if(qnaWriterSession != null) {
//			TextMessage tmpMsg = new  TextMessage(qnaWriterSession + "님이" )
//		}
//			
//			
//		}
//	}
//	private String getId(WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//		User loginUser =(User)httpSession.get(sessions.LOGIN);
//		if (null == loginUser)
//			return session.getId();
//		else
//			return loginUser.getUsername();
//	}


}
