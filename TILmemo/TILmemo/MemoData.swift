//
//  MemoData.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

/* 사용자가 입력한 값을 저장하는 파일
   앱 전체가 사용하는 데이터의 형식과 기준을 결정해줘야된다
 */

class MemoData {
    var memoId : Int? // 데이터 식별
    var title : String? // 메모 제목
    var contents : String? // 내용
    var image : UIImage? // 이미지
    var tilDate : Date? // TIL 작성일
}
