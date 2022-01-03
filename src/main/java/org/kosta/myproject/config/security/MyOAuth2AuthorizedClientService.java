package org.kosta.myproject.config.security;


import java.util.LinkedHashMap;

import org.apache.commons.lang3.NotImplementedException;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
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
        System.out.println("액세스 토큰" + accessToken);
        System.out.println("프로바이더 타입" + providerType);
        
        OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
        String id = String.valueOf(oauth2User.getAttributes().get("id"));
        String name = (String) (((LinkedHashMap) oauth2User.getAttribute("kakao_account")).get("profile"));
        String email = (String) ((LinkedHashMap) ((LinkedHashMap) oauth2User.getAttribute("kakao_account"))).get("email");
        System.out.println(email);
        
        MemberDTO member = new MemberDTO(email, name, name, "null", "null", "null", "null", 1);
        membermapper.registerMember(member);
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
