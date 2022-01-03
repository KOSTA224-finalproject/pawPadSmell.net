package org.kosta.myproject.config.security;


import java.util.Map;

import org.apache.commons.lang3.NotImplementedException;
import org.kosta.myproject.model.domain.AuthorityDTO;
import org.kosta.myproject.model.domain.MemberDTO;
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


	@Override
	public void saveAuthorizedClient(OAuth2AuthorizedClient oAuth2AuthorizedClient, Authentication authentication) {
		String providerType = oAuth2AuthorizedClient.getClientRegistration().getRegistrationId();
        OAuth2AccessToken accessToken = oAuth2AuthorizedClient.getAccessToken();
        
        OAuth2User oauth2User = (OAuth2User)authentication.getPrincipal();


        // kakao는 kakao_account에 유저정보가 있다. (email)

//        System.out.println(kakaoProfile);
//
//        System.out.println(oauth2User);
        String name = oauth2User.getAttribute("name");
        int id = Integer.parseInt(oauth2User.getName());
//        System.out.println(id);
//        String name = (String) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) oauth2User.getAttribute("kakao_account")).get("profile")).get("nickname");
//        System.out.println(name);
//        String email = (String) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) oauth2User.getAttribute("kakao_account"))).get("email");
//        System.out.println(email);
        
        MemberDTO member = new MemberDTO(Integer.toString(id), name, name, "null", "null", "null", "20000101", 1);
        if(membermapper.findMemberById(Integer.toString(id))==null) {
        	membermapper.registerMember(member);
            AuthorityDTO authority = new AuthorityDTO(member.getMemberId(), "ROLE_MEMBER");
    		membermapper.registerRole(authority);
    		System.out.println(authority);
        }else {
        	membermapper.findMemberById(Integer.toString(id));
        }
        
        System.out.println(member);


//        
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
