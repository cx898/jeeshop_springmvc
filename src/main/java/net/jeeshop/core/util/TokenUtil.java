package net.jeeshop.core.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import sun.misc.BASE64Encoder;

/**
 * 防止表单重复提交工具类
 * @author huangf
 *
 */
public class TokenUtil {
	private static final Logger logger = Logger.getLogger(TokenUtil.class);
	private static final TokenUtil instance = new TokenUtil();
	private Object checkTokenLock = new Object();
	private BASE64Encoder encoder = new BASE64Encoder();// base64编码
	private TokenUtil() {
	}

	public static TokenUtil getInstance() {
		return instance;
	}

	/**
	 * 生成token
	 * @return
	 */
	public String generateToken(HttpSession session) {
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte[] md5 = md.digest(UUID.randomUUID().toString().getBytes());
			String token = encoder.encode(md5);
//			logger.error("tokenStr=" + token);
			session.setAttribute("token", token);
			return token;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 验证请求中的token和session中的是否一致，如果不一致说明是非法的或重复请求。
	 * 
	 * @param request
	 * @return true:合法请求，false:重复请求
	 */
	public boolean isTokenValid(HttpServletRequest request) {
		synchronized (checkTokenLock) {
			String client_token = request.getParameter("token");
			if (client_token == null) {
				return false;
			}
			String server_token = (String) request.getSession().getAttribute("token");
			request.getSession().removeAttribute("token");
			logger.error("server_token = " + server_token);
			if (server_token == null) {
				return false;
			}
			if (!client_token.equals(server_token)) {
				return false;
			}
			return true;
		}
	}
}
