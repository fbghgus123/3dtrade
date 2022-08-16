import 'package:tradeApp/app/model/product.dart';

/**
 * DB 연결 전 임시 사용 데이터
 */
class TmpProduct {
  static List<ProductData> items = [
    ProductData(
        id: 0,
        images: ["ntb1.jpeg", "ntb2.png", "ntb3.png"],
        title: "서피스 노트북 팝니다 급처",
        category: "디지털기기",
        content: "서피스 노트북 팝니다\n쌉니다 싸요",
        price: 50000,
        seller: 1),
    ProductData(
        id: 1,
        images: ["image1.jpeg", "image2.jpeg"],
        title: "조립식 철재 테이블",
        category: "가구/인테리어",
        content:
            "가로 40cm 세로 40cm 높이 50cm 조립식 철제 테이블이랑 도자기 주전자에 수경식물 스킨이구요 핑크색 도자기에 생화같은 조화랑 원목 받침대 2개 포함이에요\n --- 복잡해서 내보냅니다! 공간에 예쁘게 장식해보실분 가지러 오세요 --- ",
        price: 10000,
        seller: 1),
    ProductData(
        id: 2,
        images: [
          "SoundBar1.jpeg",
          "SoundBar2.jpeg",
          "SoundBar3.jpeg",
          "SoundBar4.jpeg"
        ],
        title: "LG사운드바 새상품 판매",
        category: "디지털기기",
        content: "LG사운드바 판매합니다.\n새상품이고 박스 열어보지도 않은 상태입니다.",
        price: 150000,
        seller: 2),
    ProductData(
        id: 3,
        images: ["yumo1.jpeg", "yumo2.jpeg", "yumo3.jpeg"],
        title: "미고 휴대용 유모차 팝니다",
        category: "유아용",
        content:
            "앞버튼 한쪽이 빠져서 아이간식값만 받고 팝니다~\n사용하는데는 문제 없구요!\n방한커버는 한 번도 사용하지 않았는데 막 접혀 서랍에 넣어놨더니 아래쪽이 색상이 변한 것 처럼 되긴 했는데 필요하시면 같이 드릴게요 ~~",
        price: 5000,
        seller: 3),
    ProductData(
        id: 4,
        images: ["ps1.jpeg", "ps2.jpeg", "ps3.jpeg"],
        title: "플스5 디스크에디션 팔아요",
        category: "디지털기기",
        content: "듀얼 1개 추가구매했습니다\n리셀 주고 구매했습니다\n게임 몇 개 들어가있는데 거의 사용안했음요",
        price: 750000,
        seller: 3),
    ProductData(
        id: 5,
        images: ["ns1.jpeg"],
        title: "닌텐도 스위치 oled 새제품 판매합니다",
        category: "디지털기기",
        content:
            "안녕하세요~~\n닌텐도 스위치 oled 판매합니다~~\n지인분 선물 받은건데... 안쓴다하여 판매합니다.\n 미개봉이구요 오창 직거래 희망합니다 ~~~",
        price: 350000,
        seller: 3),
    ProductData(
        id: 6,
        images: ["cd1.jpeg", "cd2.jpeg", "cd3.jpeg"],
        title: "코닥 미니샷2",
        category: "디지털기기",
        content: "비대면 거래합니다! 문 앞에 걸어둘거에요\n본체+충전선\n네고 문의 X",
        price: 90000,
        seller: 3),
    ProductData(
        id: 7,
        images: ["ym1.jpeg"],
        title: "야마하 오디오 (싸게팝니다)",
        category: "디지털기기",
        content: "시디는 고장 그리고 라디오 및 USB 잘됩니다.\n상태 좋아요\n인테리어 굿",
        price: 70000,
        seller: 3),
    ProductData(
        id: 8,
        images: ["sticker1.jpeg"],
        title: "띠부띠부씰 피카츄",
        category: "게임/취미",
        content:
            "띠부씰 피카츄\n진화계열 판매합니다.(개별판매X)\n\n흥덕구 전 지역은 다 갑니다.\n\n단, 오송읍, 옥산면 쪽은 못갑니다.\n일괄 5000원 입니다",
        price: 5000,
        seller: 3),
  ];
}
