package com.damoim.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class Membership {
    private Integer membershipCode; // 클럽코드
    private String membershipName; // 클럽이름
    private String membershipImg; // 클럽메인사진
    private String membershipInfo; // 클럽소개
    private java.sql.Date membershipDate; // 클럽생성날짜
    private Double membershipGrade; // 클럽 별점
    private Integer membershipMax; // 클럽최대인원
}

