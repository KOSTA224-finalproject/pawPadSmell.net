package org.kosta.myproject.config.security;

import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;


//스프링 시큐리티 설정 클래스 
@Configuration
@EnableWebSecurity
//@Secured @PreAuthorize, @PostAuthorize 애노테이션을 사용하여 인증,인가 처리를 하고 싶을때 사용하는 옵션
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


	//비밀번호 암호화를 위한 bean 생성 -> MemberService 에서 비번 암호화를 위해 사용 , 
	//MemberAuthenticationProvider 에서 비번 일치여부를 위해 사용 
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	/*
	 * @Override public void configure(WebSecurity web) {
	 * web.httpFirewall(defaultHttpFirewall()); }
	 * 
	 * @Bean public HttpFirewall defaultHttpFirewall() { return new
	 * DefaultHttpFirewall(); }
	 */
	/*
	 	인증(authentication)을 위한 설정은 아래의 메서드에서 처리한다 (로그인 기능과 로그인 여부에 따른 서비스 접근에 대한 설정 ) 
	 	인가(authorization)에 대한 설정은 각 컨트롤러 메서드에서 @Secured("ROLE_ADMIN") 와 같이 설정한다  
	 	( 인증받은 회원이 부여받은 권한에 의거해 접근할 수 있는 서비스에 대한 설정 ) 	 	
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		/*	
		 	인증 처리 : 로그인 여부에 따라 접근 가능한 서비스를 설정 
		 	/  , home : welcome file 		
			
			정적인 파일 ( css , javascript , image ) 은 static 디렉토리 이하에 위치시킨다 
			/myweb/** 이하 하위 디렉토리(css, images, js) 및 파일에 접근 허용  
			
			/guest/ 로그인 없어도 서비스할 url 
			위의 지정한 url 에는 permitAll() 로그인 인증없이 서비스 되고 
			그 외의 요청에는 anyRequest().authenticated()  로그인 인증된 사용자만 접근할 수 있다 
		 */
		http.authorizeRequests().antMatchers("/", "/home", "/myweb/**", "/guest/**","/replyEcho","/oauth2/**").permitAll()
		.anyRequest().authenticated()
		.and()
		.oauth2Login()
		.userInfoEndpoint() // oauth2 로그인 성공 후 가져올 때의 설정들
		.customUserType(KakaoOAuth2User.class, "kakao");
        // 소셜로그인 성공 시 후속 조치를 진행할 UserService 인터페이스 구현체 등록
//       .userService(customOAuth2UserService); // 리소스 서버에서 사용자 정보를 가져온 상태에서 추가로 진행하고자 하는 기능 명시

		
		// 인증(authentication): 로그인을 위한 설정
		http.formLogin().loginPage("/guest/loginForm") // 로그인 폼이 있는 url
				.loginProcessingUrl("/login")// login form 의 action 경로 
				.failureUrl("/login_fail") // 로그인 실패시 메세지 보여줄 url
				.defaultSuccessUrl("/home") // 로그인 성공 후 이동할 url
				.usernameParameter("id")
				.passwordParameter("password").and() //로그인 폼에서 전달할 폼 입력양식의 name 
				.formLogin().permitAll();//로그인 폼은 인증없이 접근하도록 설정 
		// 로그아웃을 위한 설정
		http.logout().permitAll().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true);
		//인가에 대한 설정 : 서비스 접근 권한이 없을 때 accessDeniedView 로 이동된다 
		http.exceptionHandling().accessDeniedPage("/accessDeniedView");
		//Ajax 요청에 대한 인증,인가 확인  
		http.exceptionHandling().authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/"));
	}

public class MyOAuth2SuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication authentication) {
        String id = authentication.getName();
        System.out.println("들어와ㅓㅆ어요" + id);

        LinkedHashMap<String, Object> properties = (LinkedHashMap<String, Object>) ((DefaultOAuth2User)authentication.getPrincipal()).getAttributes().get("properties");
        String name = (String) properties.get("nickname");

        String token = JWT.create()
			                .withClaim("id", id)
			                .withClaim("name", name)
			                .withExpiresAt(new Date(System.currentTimeMillis() + SecurityConstants.EXPIRATION_TIME))
			                .sign(Algorithm.HMAC512(SecurityConstants.SECRET.getBytes()));

        res.addHeader(SecurityConstants.HEADER_STRING, SecurityConstants.TOKEN_PREFIX + token);
    }
}

	

}