//
//  constant.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2022/12/22.
//

import Foundation

struct WeatherStation {
    static let locationDic : [String : [Double]] = [
        "서울특별시" : [37.57142, 126.9658],
        "경기도" : [37.26399, 127.48421],
        "인천광역시": [37.47772, 126.6249],
        "강원도" : [37.90262, 127.7357],
        "대전광역시" : [36.37198, 127.37211],
        "세종특별자치시" : [36.48522, 127.24438],
        "광주광역시" : [35.17294, 126.89156],
        "대구광역시" : [35.87797, 128.65295],
        "부산광역시" : [35.10468, 129.03203],
        "울산광역시" : [35.58237, 129.33469],
        "제주특별자치도" : [33.51411, 126.52969],
        "충청북도" : [36.97045, 127.9525],
        "충청남도" : [36.76217, 127.29282],
        "경상북도" : [36.03201, 129.38002],
        "경상남도" : [35.16378, 128.04004],
        "전라북도" : [35.84092, 127.11718],
        "전라남도" : [34.81732, 126.38151]
    ]
}

struct Region {
    static let regionDic : [String : [String]] = [
        "서울특별시" : ["전체", "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중량구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구" ],
        "경기도" : [ "전체", "수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "동두천시", "평택시", "안산시", "고양시", "과천시", "구리시", "남양주시", " 오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군" ],
        "인천광역시" : [ "전체", "중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군" ],
        "강원도" : [ "전체", "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군","양양군" ],
        "대전광역시" : [ "전체", "동구", "중구", "서구", "유성구", "대덕구" ],
        "세종특별자치시": [ "전체" ],
        "광주광역시" : [ "전체", "동구", "서구", "남구", "북구", "광산구" ],
        "대구광역시" : [ "전체", "중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군" ],
        "부산광역시" : [ "전체", "중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군" ],
        "울산광역시" : [ "전체", "중구", "남구", "동구", "북구", "울주군" ],
        "제주특별자치도" : [ "전체", "제주시", "서귀포시" ],
        "충청북도" : [ "전체", "청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
        "충청남도" : [ "전체", "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ],
        "경상북도" : [ "전체", "포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군" ],
        "경상남도" : [ "전체", "창원시", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군" ],
        "전라북도" : [ "전체", "전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ],
        "전라남도" : [ "전체", "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ]
    ]
}

struct AttractionType {
    static let attrationTypeDic: [String : Int] = [
        "관광지": 12,
        "문화시설": 14,
        "축제/행사": 15,
        "레져": 28,
        "맛집": 39,
        "쇼핑": 38
    ]
    
    static let IntroTouristDic: [String : String] = [
        "accomcount": "수용인원",
        "chkbabycarriage": "유모차대여",
        "chkcreditcard": "신용카드가능",
        "chkpet": "애완동물동반가능",
        "expagerange": "체험가능 연령",
        "expguide": "체험안내",
        "infocenter": "문의 및 안내",
        "parking": "주차시설",
        "restdate": "쉬는날",
        "useseason": "이용시기",
        "usetime": "이용시간"
    ]
    
    static let IntroCulturalFacilityDic: [String : String] = [
        "accomcountculture": "수용인원",
        "chkbabycarriageculture": "유모차대여",
        "chkcreditcardculture": "신용카드가능",
        "chkpetculture": "애완동물동반가능",
        "discountinfo": "할인정보",
        "infocenterculture": "문의 및 안내",
        "parkingculture": "주차시설",
        "parkingfee": "주차요금",
        "restdateculture": "쉬는날",
        "usefee": "이용요금",
        "usetimeculture": "이용시간",
        "spendtime": "관람 소요시간"
    ]
    
    static let IntroFestivalDic: [String : String] = [
        "agelimit": "관람 가능연령",
        "bookingplace": "예매처",
        "discountinfofestival": "할인정보",
        "eventenddate": "행사 종료일",
        "eventhomepage": "행사 홈페이지",
        "eventplace": "행사 장소",
        "eventstartdate": "행사 시작일",
        "placeinfo": "행사장 위치안내",
        "playtime": "공연시간",
        "program": "행사 프로그램",
        "spendtimefestival": "관람 소요시간",
        "sponsor1": "주최자 정보",
        "sponsor1tel": "주최자 연락처",
        "subevent": "부대행사",
        "usetimefestival": "이용요금"
    ]
    
    static let IntroLeisureDic: [String: String] = [
        "accomcountleports": "수용인원",
         "chkbabycarriageleports": "유모차대여",
         "chkcreditcardleports": "신용카드가능",
         "chkpetleports": "애완동물동반가능",
         "expagerangeleports": "체험 가능연령",
         "infocenterleports": "문의 및 안내",
         "openperiod": "개장기간",
         "parkingfeeleports": "주차요금",
         "parkingleports": "주차시설",
         "reservation": "예약안내",
         "restdateleports": "쉬는날",
         "usefeeleports": "입장료",
         "usetimeleports": "이용시간"
    ]
    
    static let IntroShoppingDic: [String: String] = [
         "chkbabycarriageshopping": "유모차대여",
         "chkcreditcardshopping": "신용카드가능",
         "chkpetshopping": "애완동물동반가능",
         "culturecenter": "문화센터 바로가기",
         "fairday": "장서는 날",
         "infocentershopping": "문의 및 안내",
         "opendateshopping": "개장일",
         "opentime": "영업시간",
         "parkingshopping": "주차시설",
         "restdateshopping": "쉬는날",
         "restroom": "화장실",
         "saleitem": "판매 품목",
         "saleitemcost": "판매 품목별 가격",
         "scaleshopping": "규모",
         "shopguide": "매장안내"
    ]
    
    static let IntroRestaurantDic: [String: String] = [
         "chkcreditcardfood": "신용카드가능",
         "discountinfofood": "할인정보",
         "firstmenu": "대표 메뉴",
         "infocenterfood": "문의 및 안내",
         "kidsfacility": "어린이 놀이방",
         "opentimefood": "영업시간",
         "packing": "포장 가능",
         "parkingfood": "주차시설",
         "reservationfood": "예약안내",
         "restdatefood": "쉬는날",
         "seat": "좌석수",
         "smoking": "금연/흡연",
         "treatmenu": "취급 메뉴"
    ]
}
