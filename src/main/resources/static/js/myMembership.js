$(document).ready(function() {
    // 버튼 클릭 시 해당 섹션의 표시/숨김 처리
    $("#all-club-button").click(function() {
        $(".membership-card").hide(); // 모든 카드 숨기기
        $("#all-club").show(); // 전체 목록 카드만 보이기
    });
    $("#manage-club-button").click(function() {
        $(".membership-card").hide(); // 모든 카드 숨기기
        $("#manage-club").show(); // 내가 관리중인 클럽 카드만 보이기
    });
    $("#belong-club-button").click(function() {
        $(".membership-card").hide(); // 모든 카드 숨기기
        $("#belong-club").show(); // 가입 중인 클럽 카드만 보이기
    });
    $("#wait-club-button").click(function() {
        $(".membership-card").hide(); // 모든 카드 숨기기
        $("#wait-club").show(); // 가입 대기중인 클럽 카드만 보이기
    });

    // 카드 클릭 시 카드 내용 표시
    $(".membership-each").click(function(e) {
        e.stopPropagation(); // 카드 내용 클릭 시 이벤트 버블링 방지
        let clickedCard = $(this).closest('.membership-card'); // 클릭된 카드의 부모 카드
        let content = clickedCard.find(".membership-each"); // 클릭된 카드의 내용

        // 클릭된 카드의 내용만 표시하고, 나머지는 숨기기
        if (content.is(":visible")) {
            content.slideUp(500); // 현재 보이는 카드가 클릭된 경우 숨기기
        } else {
            $(".membership-card").find(".membership-each").slideUp(500); // 모든 카드 내용 숨기기
            content.slideDown(500); // 클릭된 카드의 내용만 표시하기
        }
    });
});