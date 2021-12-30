//package org.kosta.myproject.model.service;
//
//import java.util.LinkedHashMap;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
//import org.springframework.security.oauth2.core.OAuth2AccessToken;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Service;
//
////public interface OAuth2AuthorizedClientService {
////    <T extends OAuth2AuthorizedClient> T loadAuthorizedClient(String var1, String var2);
////    void saveAuthorizedClient(OAuth2AuthorizedClient var1, Authentication var2);
////    void removeAuthorizedClient(String var1, String var2);
////}
//
//// 직접 생성한 구현 클래스 - 인증 정보를 DB에 저장
//@Service
////public class MyOAuth2AuthorizedClientService implements OAuth2AuthorizedClientService {
////
////    @Autowired
////    private MemberRepository memberRepository;
////
////    @Override
////    public void saveAuthorizedClient(OAuth2AuthorizedClient oAuth2AuthorizedClient, Authentication authentication) {
////        String providerType = oAuth2AuthorizedClient.getClientRegistration().getRegistrationId();
////        OAuth2AccessToken accessToken = oAuth2AuthorizedClient.getAccessToken();
////
////        OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
////        String id = String.valueOf(oauth2User.getAttributes().get("id"));
////        String name = (String) ((LinkedHashMap) ((LinkedHashMap) oauth2User.getAttribute("kakao_account")).get("profile")).get("nickname");
////
////        Member member = new Member(id, name, providerType, accessToken.getTokenValue());
////        memberRepository.save(member);
////    }
////
////    @Override
////    public <T extends OAuth2AuthorizedClient> T loadAuthorizedClient(String s, String s1) {
////        throw new NotImplementedException();
////    }
////
////    @Override
////    public void removeAuthorizedClient(String s, String s1) {
////        throw new NotImplementedException();
////    }
////}