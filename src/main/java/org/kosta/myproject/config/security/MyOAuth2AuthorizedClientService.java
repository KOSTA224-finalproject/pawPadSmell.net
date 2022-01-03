package org.kosta.myproject.config.security;


import java.util.Map;

import org.apache.commons.lang3.NotImplementedException;
import org.kosta.myproject.model.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;



// 직접 생성한 구현 클래스 - 인증 정보를 DB에 저장
@Service
public class MyOAuth2AuthorizedClientService implements OAuth2AuthorizedClientService {

    @Autowired
    private MemberMapper membermapper;


	@SuppressWarnings("unchecked")
	public void saveAuthorizedClient(OAuth2AuthorizedClient oAuth2AuthorizedClient, Authentication authentication) {
		String providerType = oAuth2AuthorizedClient.getClientRegistration().getRegistrationId();
        OAuth2AccessToken accessToken = oAuth2AuthorizedClient.getAccessToken();

        OAuth2User oauth2User = (OAuth2User)authentication.getPrincipal();
        System.out.println(oauth2User);
        // kakao는 kakao_account에 유저정보가 있다. (email)
//        Map<String, Object> kakaoAccount = (Map<String, Object>)oauth2User.getAttribute("kakao_account");
//        // kakao_account안에 또 profile이라는 JSON객체가 있다. (nickname, profile_image)
//        Map<String, Object> kakaoProfile = (Map<String, Object>)kakaoAccount.get("profile");
//        System.out.println(kakaoProfile);

//        OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
//        System.out.println(oauth2User);
//        String id = String.valueOf(oauth2User.getAttributes().get("id"));
//        System.out.println(id);
//        String name = (String) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) oauth2User.getAttribute("kakao_account")).get("profile")).get("nickname");
//        System.out.println(name);
//        String email = (String) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) oauth2User.getAttribute("kakao_account"))).get("email");
//        System.out.println(email);
        
//        MemberDTO member = new MemberDTO(email, name, name, "null", "null", "null", "null", 1);
//        membermapper.registerMember(member);
//        AuthorityDTO authority = new AuthorityDTO(member.getMemberId(), "ROLE_MEMBER");
//		membermapper.registerRole(authority);
//		System.out.println(authority);
        
    }

    @Override
    public <T extends OAuth2AuthorizedClient> T loadAuthorizedClient(String s, String s1) {
        throw new NotImplementedException();
    }

    @Override
    public void removeAuthorizedClient(String s, String s1) {
        throw new NotImplementedException();
    }

}
