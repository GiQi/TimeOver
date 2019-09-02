//
//  RJButtonAdd.m
//  RJLoginDemo
//
//  Created by Apple on 2019/8/26.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "RJButtonAdd.h"
@interface RJButtonAdd()
{
//    int count;
    UIView *VC;
    UIImageView *imgVc;
    
    UIButton * addButton;
    UIButton * addButton2;
    UIButton * addButton3;
    UIButton * provisionBtn;

    NSString *count;
    
    UITextView *provisonText1;
    UITextView *provisonText2;
    UITextView *provisonText3;
}
@end


@implementation RJButtonAdd


-(void)setProvisionView:(UIViewController *)viewC
{
            UIImage *image = [UIImage imageNamed:@"provision_UI"];
            UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
            imageV.frame = CGRectMake(0, 0, 720, 360);
            imageV.center = viewC.view.center;
            [viewC.view addSubview:imageV];
    
            addButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [addButton setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
            addButton.selected = YES;
            [addButton addTarget:self action:@selector(BingoButton) forControlEvents:UIControlEventTouchUpInside];
            addButton.frame = CGRectMake(viewC.view.center.x - 242, viewC.view.center.y + 75, 30, 20);
            [viewC.view addSubview:addButton];
    
    
    
            addButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [addButton2 setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
            addButton2.selected = YES;
            [addButton2 addTarget:self action:@selector(BingoButton2) forControlEvents:UIControlEventTouchUpInside];
            addButton2.frame = CGRectMake(viewC.view.center.x - 75, viewC.view.center.y + 75, 30, 20);
            [viewC.view addSubview:addButton2];
    
    
            addButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [addButton3 setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
            addButton3.selected = YES;
            [addButton3 addTarget:self action:@selector(BingoButton3) forControlEvents:UIControlEventTouchUpInside];
            addButton3.frame = CGRectMake(viewC.view.center.x + 91, viewC.view.center.y + 75, 30, 20);
            [viewC.view addSubview:addButton3];
    
    
            provisionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [provisionBtn setImage:[UIImage imageNamed:@"provision_button"] forState:UIControlStateNormal];
            [provisionBtn addTarget:self action:@selector(ArrageProvision) forControlEvents:UIControlEventTouchUpInside];
            provisionBtn.frame = CGRectMake(viewC.view.center.x - 74, viewC.view.center.y + 121, 139, 34);
            [viewC.view addSubview:provisionBtn];
}

-(void)setView:(UIViewController *)viewC andBackgroundImg:(NSString *)img setRect:(CGRect )rect
{
    //登录视图背景
    viewC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    viewC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    UIImage *uimg = [UIImage imageNamed:img];
    imgVc = [[UIImageView alloc]initWithImage:uimg];
    imgVc.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    imgVc.center = viewC.view.center;
    [viewC.view addSubview:imgVc];
    //清空按钮数组
    [_btnAry removeAllObjects];
    //    return self;
}

//一个
-(void)addView:(UIView*)view setMark:(CGRect)rect setImageNamed:(NSString *)img addAction:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (img !=nil) {
        [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    }
    if (action!=nil) {
        [btn addTarget:self.delegate action:action forControlEvents:UIControlEventTouchUpInside];
    }
    btn.frame = CGRectMake(rect.origin.x, rect.origin.y, CGRectGetWidth(rect), CGRectGetHeight(rect));
    [view addSubview:btn];
    
    [self.btnAry addObject:btn];
//    UILabel * btnLab = [[UILabel alloc]initWithFrame:CGRectMake(btn.frame.origin.x, btn.center.y + 50, 90, 20)];
//    [btnLab setText:img];
//    btnLab.textColor = UIColor.grayColor;
//    [btnLab setFont:[UIFont systemFontOfSize:14 weight:1]];
//    btnLab.textAlignment = NSTextAlignmentCenter;
//      [testVC.view addSubview:btnLab];
}
//多个按钮
-(void)setBtnImg:(NSArray *)img setAction:(NSArray *)action
{
    //按钮img个数为按钮个数
    @try {
            if (img.count == 1) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setImage:[UIImage imageNamed:img[0]] forState:UIControlStateNormal];
                [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
                btn.tag=img.count;
                btn.frame = CGRectMake(0,0, imgVc.bounds.size.height/2,  imgVc.bounds.size.height/2);
                btn.center = imgVc.center;
                [self.RJVC.view addSubview:btn];
            }
            else
            {
                for (int btnCount=1; btnCount<=img.count; btnCount++) {
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                    [btn setImage:[UIImage imageNamed:img[btnCount-1]] forState:UIControlStateNormal];
                    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
                    btn.tag=img.count;//标记按钮
                    //按钮frame
                    btn.frame = CGRectMake(imgVc.frame.origin.x+imgVc.bounds.size.width/img.count*(btnCount-1),imgVc.center.y-imgVc.frame.size.height/4, imgVc.bounds.size.height/2,  imgVc.bounds.size.height/2);
                    NSLog(@"bounds-x %f",imgVc.bounds.origin.x);
                    NSLog(@"frame-x %f",imgVc.frame.origin.x);

                NSLog(@"%f,%f,%f,%f",imgVc.bounds.size.width/img.count*(btnCount-1),imgVc.center.y, imgVc.bounds.size.height/2,imgVc.bounds.size.height/2);
                    [self.RJVC.view addSubview:btn];
                    
                }
//                [VC addSubview:self.loginView.view];
            }
        

    } @catch (NSException *exception) {
        NSLog(@"数组为空");
    } @finally {
    }
}

-(NSMutableArray *)btnAry
{
    if (_btnAry == nil) {
        _btnAry = [[NSMutableArray alloc]init];
    }
    return _btnAry;

}
-(UIViewController *)RJVC
{
    if (_RJVC == nil) {
        _RJVC = [[UIViewController alloc]init];
    }
    return _RJVC;
}
//
//- (SEL)RJAction
//{
//
//}
//
//-(void)setRJAction:(SEL)RJAction
//{}
- (void)BingoButton{
    
    addButton.selected =!addButton.selected;
    
    if(addButton.selected && addButton2.selected){
        provisionBtn.hidden = NO;
    }else{
        provisionBtn.hidden = YES;
    }
    
    if(addButton.selected){
        [addButton setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }else{
        [addButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

- (void)BingoButton2{
    
    
    addButton2.selected =!addButton2.selected;
    
    
    if(addButton.selected && addButton2.selected){
        provisionBtn.hidden = NO;
    }else{
        provisionBtn.hidden = YES;
    }
    
    if(addButton2.selected){
        [addButton2 setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }else{
        [addButton2 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}


- (void)BingoButton3{
    
    addButton3.selected =!addButton3.selected;
    
    if(addButton3.selected){
        [addButton3 setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }else{
        [addButton3 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}
-(void)ArrageProvision{
    count = @"1";
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:count forKey:@"provisonCount"];
    [defaults synchronize];
    [_RJVC dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)ProvisionText3{
    
    provisonText3 = [[UITextView alloc]initWithFrame:CGRectMake(_RJVC.view.center.x + 93, _RJVC.view.center.y -76, 138, 142)];
    
    provisonText3.text =@"마케팅 활용을 위한 제 3자 정보 제공 동의(선택)\n\n개인정보 제공받는자 : withhug, (주)모나와\n개인정보 제공받는자의 개인정보 이용 목적 : withhug 게임 서비스 정보(출시, 업데이트 등)및 관련 이벤트 안내\n제공하는 개인정보의 항목 : 전화번호\n개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 제공 후 2년\n(단, 보유 및 이용기간이 경과하거나, 수집 및 목적 달성 시 즉시 파기)\n\n이용자는 동의를 거부할 수 있으며, 이경우 withhug 게임 서비스 정보 및 관련 이벤트 안내를 받으실 수 없습니다.\n";
    
    provisonText3.editable = NO;
    [_RJVC.view addSubview:provisonText3];
}

-(void)ProvisionText2{
    
    provisonText2 = [[UITextView alloc]initWithFrame:CGRectMake(_RJVC.view.center.x - 72, _RJVC.view.center.y -76, 136, 142)];
    
    provisonText2.text = @"㈜모나와는 (이하 '모나와'라 함) 회원님의 개인정보를 중요시하며, 『개인정보 보호법』, 『정보통신망 이용촉진 및 정보보호에 관한 법률』 등 관련 법규들을 준수하고 있습니다. 모나와는 개인정보취급방침을 통하여 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.\n\n이 개인정보 취급방침의 순서는 다음과 같습니다.\n제1조 수집하는 개인정보 항목 및 수집방법\n제2조 개인정보의 수집 및 이용목적\n제3조 수집한 개인정보의 공유 및 제공\n제4조 개인정보 보유 및 이용기간\n제5조 개인정보 파기절차 및 방법\n제6조 개인정보의 기술적/관리적 보호 대책\n제7조 개인정보 관리책임자 및 담당부서\n제8조 청소년보호를 위한 활동\n제9조 고지의 의무\n\n제1조 수집하는 개인정보 항목 및 수집방법\n모나와는 원활한 서비스 제공 및 고객상담, 각종 데이터 통계 등을 위해 다음과 같이 회원님의 개인정보를 수집하고 있습니다.\n1. 수집항목\n- 게임 이용기록, 접속 로그, 결제기록(회원이 구매한 아이템 아이디, 아이템 가격, 마켓 주문 번호 등), 게임버전, 단말기 정보(모델명, OS 종류 및 버전 등), 서비스 이용정보, 이용자가 가입 시 입력한 ID(계정), SNS 계정명, 고객지원 1:1문의 시 입력한 E-mail, 전화번호\n2. 수집방법\n- 고객지원 1:1문의, 서면양식, 팩스, 전화, E-mail, 이벤트 응모, 배송요청\n- 협력회사로부터의 제공\n- 계정 생성정보 툴을 통한 수집\n\n제2조 개인정보의 수집 및 이용목적\n모나와는 수집한 회원님의 개인정보를 다음의 목적과 같이 사용하며 이용자의 동의 없이는 해당 범위 밖으로 이용하거나 사용하지 않습니다.\n단, 이용자가 사전에 개인정보 공개에 대하여 동의한 경우나 관련 법규에 의한 경우 또는 수사기관의 정보제공 요청에 의한 경우에는 외부에 공개합니다.\n1) 회원 가입 시 수집하는 개인정보의 종류 및 이용목적\n- 종류: ID(계정), SNS 계정명, 전화번호\n- 목적: 회원 중복가입, 고객상담 및 이벤트 안내, 고지사항, 불량회원 제재.\n2) 애플리케이션 게임 이용 시 수집하는 개인정보의 종류 및 이용 목적\n- 종류: 단말기 정보(모델명, OS종류 및 버전 등), 게임이용 및 접속로그, 게임버전\n- 목적: 회원의 서비스 이용 내역 관리, 신규서비스 개발, 통계학적 특성에 따른 서비스 제공 및 광고의 게재, 서비스 유효성 확인, 이벤트 참여기회 제공, 접속빈도 파악, 고객의 서비스 이용에 대한 통계, 불량이용자 이용제한 등.\n3) 유료서비스 이용 시 수집되는 개인정보의 종류 및 이용목적\n- 종류: 결제기록(회원이 구매한 아이템 아이디, 아이템 가격, 마켓 주문 번호)\n- 결제 내역 관리 및 고객 문의 요청 대응\n\n제3조 수집한 개인정보의 공유 및 제공\n모나와는 회원의 개인정보를 본 정책에서 고지한 범위 내에서 사용하며, 외부에 제공하지 않습니다. 다만 아래의 경우는 예외로 합니다.\n1) 전기통신기본법, 전기통신사업법 등 관계 법령의 규정에 의거하거나, 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우\n2) 통계작성, 학술 연구 또는 시장조사를 위하여 필요한 경우로서, 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우\n\n제4조 개인정보 보유 및 이용기간\n모나와는 이용자의 회원가입 후 탈퇴 전까지 이용자의 개인정보를 보관합니다. 이용자가 회원탈퇴를 하게 되면 즉시 해당 이용자의 개인정보를 파기합니다. 또한 관련법령 규정에 의하여 보존할 필요가 있는 개인정보에 대해서 다음과 같이 일정기간 보관합니다. 단, 관련법령에 규정되지 않은 정보에 대해서는 수집목적이 달성되는 즉시 파기합니다.\n1) 보유하는 개인정보 항목\n- 본 개인정보 취급방침 1조에 명시된 수집항목 전체를 보관합니다.\n2) 정보 보관 사유\n상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정기간 동안 회원정보를 보관합니다.\n이러한 경우 보존기간은 아래와 같습니다.\n(1) 계약 또는 청약철회 등에 관한 기록\n- 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 5년\n(2) 대금결제 및 재화 등의 공급에 관한 기록\n- 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 5년\n(3) 소비자의 불만 또는 분쟁처리에 관한 기록\n- 전자상거래 등에서의 소비자보호에 관한 법률, 보존 기간: 3년\n(4) 방문에 관한 기록\n- 통신비밀보호법, 보존 기간: 3개월\n(5) 본인확인에 관한 기록\n- 정보통신 이용촉진 및 정보보호 등에 관한 법률, 보존 기간: 6개월\n\n제5조 개인정보 파기절차 및 방법\n이용자의 개인정보는 원칙적으로 이용자가 회원탈퇴를 하거나 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.\n1. 파기절차\n1) 이용자가 서비스 가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.\n2) 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.\n2. 파기방법\n1) 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.\n2) 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.\n제6조 개인정보의 기술적/관리적 보호 대책\n1) 모나와는 회원의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있으며, 해당인원들은 개인정보관리 관련 교육을 받고 있습니다. 그에 해당하는 자는 다음과 같습니다.\n- 회원을 직접 상대로 하여 마케팅업무를 수행하는 자\n- 개인정보문의 처리 부서 및 담당자 등 개인정보관리업무를 수행하는 자\n- 기타 업무상 개인정보의 취급이 불가피한 자\n2) 해킹 등에 대비한 관리 대책\n- 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송 및 보관 할 수 있도록 기술적 시스템 보안에 최선을 다하고 있습니다.\n3) 회원의 개인정보 관리 및 책임\n- 모나와는 회원의 과실 및 부주의로 발생한 문제에 대해서 책임을 지지 않으며, 회원은 본인의 개인정보를 보호하기 위해서 자신의 개인정보를 안전하게 관리를 해야 하며, 그에 대한 책임을 져야 합니다.\n\n제7조 개인정보 관리책임자 및 개인정보 담당부서\n모나와는 개인정보를 보호하는데 있어 모나와의 귀책 사유로 회원님에게 고지한 사항들에 반하는 사고가 발생할 시에 개인정보관리부서가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보훼손, 침해, 누설되는 경우나 이용자 과실로 발생된 개인 정보 유출로 인한 문제에 대해 모나와는 일체의 책임을 지지 않습니다.\n모나와는 고객님의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자 및 개인정보관리담당자를 지정하고 있습니다.\n1) 개인정보 관리책임자\n소속: 게임사업팀 팀장\n성명: 이중현\nE-mail: help@withhug.kr\n2) 개인정보 관리담당자\n소속: 게임사업팀 팀장\n성명: 이중현\nE-mail: help@withhug.kr\n\n제8조 청소년보호를 위한 활동\n모나와는 각종 청소년 유해정보로부터 청소년을 보호하고자 관련법에 따라 19세미만의 청소년이 유해정보에 접근할 수 없도록 청소년보호정책을 마련하여 시행하고 있습니다. 또 모나와는 청소년의 건전한 성장을 저해하는 음란, 불법 유해정보와 비윤리적, 반사회적 행위에 대해서는 엄격하게 제재하기 위하여 다음과 같이 활동하고 있습니다.\n1. 청소년유해정보로부터의 청소년보호계획의 수립\n- 모나와는 청소년이 아무런 제한장치 없이 청소년 유해정보에 노출되지 않도록 청소년유해매체물에 대해서는 별도의 인증장치를 마련, 적용하며 청소년 유해정보가 노출되지 않기 위한 예방 차원의 조치를 강구합니다.\n2. 청소년유해정보에 대한 청소년 접근제한 및 관리조치\n- 모나와는 정보통신업무 종사자를 대상으로 청소년보호 관련 법령 및 제재기준, 유해정보 발견 시 대처방법, 위반사항 처리에 대한 보고절차 등을 교육하고 있습니다.\n3. 정보통신업무 종사자에 대한 청소년유해정보로부터의 청소년보호를 위한 교육\n- 모나와는 청소년보호담당자 및 각 서비스 담당자들을 대상으로 청소년 보호를 위한 각종 관련 법령 및 제재기준, 유해정보 발견 시 대처방법, 위반사항 처리에 대한 보고절차 등을 교육하고 있습니다.\n4. 청소년유해정보로 인한 피해상담 및 고충처리\n- 모나와는 청소년 유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 그 피해가 확산되지 않도록 하고 있습니다. 이용자 분들께서는 하단에 명시한 \"6. 청소년보호 책임자 및 담당자의 소속, 성명 및 연락처\" 항을 참고하여 전화나 메일을 통하여 피해상담 및 고충처리를 요청할 수 있습니다.\n5. 그 밖에 청소년유해정보로부터 청소년을 보호하기 위하여 필요한 사항\n- 이에 대해 모나와는 청소년보호를 위한 인터넷기업의 공동노력에 동참합니다.\n1) 청소년보호를 위한 인터넷기업 윤리강령\n2) 청소년보호를 위한 인터넷기업 실천지침\n6. 청소년 보호정책 관련 관리책임자 및 담당자\n1) 청소년 보호 관리책임자\n소속: 게임사업팀 팀장\n성명: 이중현\nE-mail: help@withhug.kr\n2) 개인정보 관리담당자\n소속: 게임사업팀 팀장\n성명: 이중현\nE-mail: help@withhug.kr\n당사 이외의 공공기관에서 상담을 원하실 경우 아래의 기관들로부터 상담을 받으실 수 있습니다.\n- 한국정보보호진흥원(KISA)내 개인정보침해신고센터(http://www.118.or.kr, 전화 118)\n- 정보보호마크 인증위원회(http://www.privacy.or.kr, 전화 02-580-0533 무료)\n- 대검찰청 첨단범죄수사과(http://www.spo.go.kr, 전화 02-3480-2000 무료)\n- 경찰청 사이버테러대응센터(http://www.ctrc.go.kr, 전화 02-392-0330 무료)\n\n제9조 고지의 의무\n모나와는 개인정보취급방침의 내용 추가, 삭제 또는 수정이 있을 시에는 최소 10일 전에 공지사항 등을 통해 회원님에게 고지합니다.\n\n본 개인정보취급방침은 2016년 9월 19일부터 시행됩니다.\n";
    provisonText2.editable = NO;
    [_RJVC.view addSubview:provisonText2];
}

-(void)ProvisionText1{
    
    provisonText1 = [[UITextView alloc]initWithFrame:CGRectMake(_RJVC.view.center.x - 240, _RJVC.view.center.y -76, 138, 142)];
    
    provisonText1.text = @"제1조 목적\n이 약관은 ㈜모나와(이하 ‘회사’라 합니다.)가 디바이스를 통해 제공하는 모든 게임 서비스(이하 ‘서비스’라 합니다.)를 이용하는 서비스 이용자(이하 ‘회원’이라 합니다.)와 회사간에 서비스의 이용에 관한 기본적인 사항을 규정하는 것을 목적으로 합니다.\n\n제2조 약관의 효력 및 변경\n1) 이 약관은 서비스 초기화면에 공지되거나 홈페이지에 온라인으로 공지함으로써 효력이 발생합니다.\n2) 합리적인 사유가 발생할 경우, 회사는 관계법령에 위배되지 않는 범위 내에서 본 약관을 개정할 수 있습니다.\n3) 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있습니다. 회사가 본 약관을 개정하는 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 서비스의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하며, 회원에게 불리한 내용 또는 중요한 내용의 개정의 경우에는 30일 이상 사전 공지하거나 홈페이지에 온라인으로 공지합니다.\n4) 이 약관에 동의하는 것은 정기적으로 서비스페이지를 방문하여 약관의 변경 사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 회사에서 책임지지 않습니다.\n5) 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.\n\n제3조 약관 외 준칙\n본 약관에 명시되지 아니한 사항에 대해서는 별도의 약관 혹은 정책을 둘 수 있으며, 약관 및 정책은 정부가 제정한 관계 법령 또는 상관례에 따릅니다.\n\n제4조 용어의 정의\n이 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n1) '회원’이란 서비스를 제공 받기 위하여 회사와 이용 계약을 체결하고 회원 ID(아이디)를 부여 받은 자를 말합니다.\n2) ‘콘텐츠’란 디바이스 등을 통하여 이용할 수 있도록 회사가 제공하는 모든 게임 및 네트워크 서비스, 어플리케이션, 게임 머니 및 게임 아이템 등 서비스와 관련되어 디지털 방식으로 제작된 내용물 일체를 말합니다.\n3) ‘디바이스’란 콘텐츠를 다운로드 받거나 설치하여 사용할 수 있는 PC, 휴대폰, 스마트 폰, PDA, 태블릿 등의 기기를 말합니다.\n4) ‘이용계약'이라 함은 서비스를 제공 받기 위하여 회사와 체결하는 계약을 말합니다.\n5) '회원 ID'란 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 부여하는 문자와 숫자의 조합을 말합니다.\n6) '해지'란 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.\n\n제5조 서비스 이용계약의 성립\n1) 이용계약은 회원이 본 이용약관 내용에 대한 동의 또는 회사의 게임을 다운로드 받거나, 이용하여 콘텐츠를 이용하는 경우 이 약관에 동의한 것으로 봅니다.\n2) 본 이용약관에 대한 동의는 해당 회원가입 페이지의 '동의함' 버튼을 누름으로써 이 약관에 동의하는 것으로 간주됩니다.\n3) 회사는 회원에게 실명확인 및 본인인증을 요청할 수 있으며, 그 절차와 방식은 관계법령에 따릅니다.\n\n제6조 서비스 이용 신청\n1) 서비스를 이용하고자 하는 회원은 회사에서 요청하는 정보(이름, 연락처 등)를 제공하여야 합니다. 단 회원이 제공한 정보는 개인정보처리(취급)방침에 따라 관리됩니다.\n2) 회원 또는 회원으로 가입하고자 하는 자는 반드시 회사가 제공하는 본인확인 방법을 통하여 서비스를 이용할 수 있으며, 본인명의로 등록하지 않은 사용자는 일체의 권리를 주장할 수 없습니다.\n3) 타인의 정보(아이핀 및 휴대폰정보 등)를 도용하여 이용 신청을 한 회원의 모든 ID는 삭제됩니다.\n\n제7조 개인정보의 보호 및 사용\n1) 회사는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 사용에 대해서는 관련 법령 및 회사의 개인정보처리(취급)방침에 따릅니다.\n2) 단, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리(취급)방침이 적용되지 않습니다.\n3) 서비스의 특성에 따라 회원의 별명, 사진 등 자신을 소개하는 글이 공개될 수 있습니다.\n제8조 이용 신청의 제한\n회원은 다음 각 호에 해당하는 행위를 하여서는 안되며, 해당 행위를 하는 경우에 회사는 회원의 서비스 이용제한, 관련 정보(글, 사진, 영상 등) 삭제 및 기타의 조치를 포함한 이용제한 조치를 가할 수 있습니다.\n1) 각종 신청, 변경, 등록 시 허위의 내용을 등록하는 행위\n2) 타인의 정보를 도용한 행위\n3) 회사로부터 특별한 권리를 받지 않고 회사의 프로그램을 변경하거나, 회사의 서버를 해킹하거나 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하거나, 회사의 서비스를 비정상적인 방법으로 사용하는 행위\n4) 회사 프로그램상의 버그를 악용하는 행위\n5) 정상적이지 아니한 방법으로 사이버 자산(ID, 캐릭터, 아이템, 게임 내 머니 등)을 취득, 양도 또는 매매하는 행위\n6) 서비스에 위해를 가하거나 서비스를 고의로 방해하는 행위\n7) 회사의 사전 승낙 없이 서비스를 이용하여 영업활동을 하는 행위\n8) 본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제3자에게 제공하는 행위\n9) 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을. 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위\n10) 청소년보호법 또는 법에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위\n11) 심히 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는\n내용을 전송, 게시 또는 기타의 방법으로 타인에게 유포하는 행위\n12) 다른 회원을 희롱 또는 위협하거나, 특정 회원에게 지속적으로 고통 또는 불편을 주는 행위\n13) 회사의 승인을 받지 않고 다른 사용자의 개인정보를 수집 또는 저장하는 행위\n14) 범죄와 결부된다고 객관적으로 판단되는 행위\n15) 기타 관계 법령에 위배되는 행위\n\n제9조 회사의 의무\n1) 회사는 관련법과 본 약관에서 금지하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.\n2) 회사는 회원의 개인정보보호를 위한 보안의무를 게을리하지 않습니다.\n3) 회사는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리 일정을 통보 하여야 합니다.\n\n제10조 회원의 의무\n1) 회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 회사가 공지하는 사항을 준수하여야 합니다. 또한 회원은 회사의 업무에 방해가 되는 행위, 회사의 명예를 손상시키는 행위를 해서는 안됩니다.\n2) 회원은 청소년보호법 등 관계 법령을 준수하여야 합니다. 회원이 청소년 보호법 등 관계 법령을 위반한 경우는 해당 법령에 의거 처벌을 받게 됩니다.\n3) 회원은 회사의 사전 승낙 없이 서비스를 이용하여 영업 활동을 할 수 없으며, 그 영업 활동의 결과에 대한 책임은 회원에게 있습니다. 또한 회원이 이와 같은 영업 활동으로 회사에 손해를 끼칠 경우, 회사는 해당 회원에 대해 서비스 이용 제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.\n\n제11조 서비스 이용\n1) 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 회사는 시스템 정기점검, 증설 및 교체, 네트워크 불안정 등 운영상 필요하다고 판단되는 경우 서비스를 일시 중지할 수 있으며, 이를 서비스 페이지를 통해 공지합니다.\n2) 회사는 서비스의 안정적인 제공을 위하여 필요한 경우, 점검을 실시 할 수 있으며, 점검의 일정과 시간은 서비스 페이지에 공지합니다.\n3) 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 회원에게 사전 또는 사후에 공지합니다.\n5) 회사는 스마트 기기를 위한 전용 애플리케이션 또는 네트워크를 이용하여 서비스를 제공하며, 회원은 애플리케이션을 다운로드 하여 설치하거나 네트워크를 이용하여 무료 또는 유료로 서비스를 이용할 수 있습니다.\n6) 유료 서비스의 경우 해당 서비스에 명시된 요금을 지불하여야 사용 가능하며 네트워크를 통해 애플리케이션 다운로드 또는 서비스를 이용하는 경우 가입한 이동통신사에서 정한 별도의 요금이 발생할 수 있습니다.\n7) 다운로드 하여 설치한 애플리케이션 또는 네트워크 서비스를 통해 이용하는 서비스의 경우 스마트 기기 또는 이동통신사의 특성에 맞도록 제공되며 스마트 기기의 변경, 번호 변경 및 해외 로밍의 경우 콘텐츠의 전부 또는 일부 기능을 이용할 수 없으며 이 경우 회사는 어떠한 책임도 부담하지 않습니다.\n8) 회사는 관련 법령, 정부 정책 등에 따라 서비스 또는 회원에 따라 서비스 이용시간을 제한할 수 있으며, 이러한 제한 사항 및 제한에 따라 발생하는 게임 이용 관련 제반 사항에 대해서는 회사가 책임을 부담하지 않습니다.\n\n제12조 서비스의 변경 및 중지\n1) 회사는 운영상 또는 기술상의 필요에 따라 제공하고 있는 서비스를 변경할 수 있습니다. 변경될 서비스의 내용 및 제공일자 등에 대해서는 앱 실행 후 초기화면에서 회원에게 사전에 통지합니다. 단, 회사가 사전에 통지할 수 없는 치명적인 버그 발생, 서버기기 결함, 긴급 보안문제 해결 등의 부득이한 사정이 있는 경우는 사후에 통지할 수 있습니다.\n2) 회사는 시장 환경의 변화, 기술적 필요, 개별 서비스 회원의 선호 감소 기타 게임의 기획이나 운영상 또는 회사의 긴박한 상황 등에 의해 서비스 전부를 중단할 필요가 있는 경우 30일 전에 앱 실행 후 초기화면, 게임 내 공지에 이를 공지하고 서비스의 제공을 중단할 수 있습니다. 회원은 상기 서비스 중단에 대하여 서비스 제공을 요구하거나 서비스 중단에 대한 배상을 청구할 수 없습니다. \n3) 회사는 다음 각호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.\n1. 전시, 사변, 천재지변 또는 국가비상사태 등 불가항력적인 사유가 있는 경우\n2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우\n3. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우\n4. 회사의 제반 사정으로 서비스를 할 수 없는 경우\n4) 회사는 서비스의 변경 및 중지로 발생하는 문제에 대해서는 책임을 지지 않습니다.\n\n제13조 회원번호 관리\n1) 회원ID와 비밀번호에 관한 모든 관리 책임은 회원에게 있습니다.\n2) 회사는 회원ID에 의하여 제반 회원 관리업무를 수행 하므로 회원이 회원ID를 변경하고자 하는 경우 회사가 인정할 만한 사유가 있어야만 회원ID를 변경할 수 있습니다.\n3) 회원이 등록한 회원ID 및 비밀번호에 의하여 발생되는 사용상의 과실 또는 제 3자에 의한 부정사용 등에 대한 모든 책임은 해당 회원에게 있습니다.\n제14조 유료 콘텐츠 구매, 사용기간 및 이용\n1) 회원은 서비스를 사용하고 있는 단말기의 종류에 따른 결제 운영정책에 따라 유료 콘텐츠를 구매할 수 있으며, 해당 결제 정책의 차이로 인해 결제금액의 차이가 발생할 수 있습니다. \n2) 게임 서비스 내에서 회원이 구매한 유료 콘텐츠는 해당 게임 서비스 애플리케이션을 다운로드 받거나 설치한 단말기에서만 이용할 수 있습니다.\n3) 회원이 구매한 유료 콘텐츠의 사용기간은 기본적으로 1년이며 이 기간이 경과한 후에는 회원이 해당 유료 콘텐츠에 대한 사용권을 상실합니다. 단, 사용기간이 별도로 명시된 유료 콘텐츠의 경우는 구매 시 명시된 사용 기간에 따릅니다. 회원은 회사가 정하여 별도로 고지한 방법 이외에는 유료 콘텐츠를 회원 본인의 계정에서만 이용할 수 있으며, 제 3자에게 양도, 대여, 매매할 수 없습니다.\n\n제15조 대금결제\n1) 콘텐츠에 대한 구매 대금은 원칙적으로 이동통신사와 애플리케이션 스토어 등에서 정하는 정책, 방법 등에 따라 부과되며 납부 방법 역시 정해진 방법에 따라 납부해야 합니다. 회사 및 결제업체의 정책, 정부의 방침 등에 따라 각 결제수단별로 한도가 부여 또는 조정될 수 있습니다.\n2) 회원이 단말기 및 오픈 마켓의 비밀번호 설정 기능 등을 이용하지 않거나 부주의하게 노출하여 발생하는 제3자의 결제에 대하여는 회사가 어떠한 책임도 부담하지 않습니다.\n\n제16조 청약 철회 및 구매 대금의 환불\n1) 회원이 구매한 유료 콘텐츠의 경우에는 계약 체결일 또는 유료 콘텐츠 이용가능일로부터 7일 이내에 별도의 수수료 없이 청약철회(구매취소)를 할 수 있습니다. 단, 선물 및 이벤트 등 회사나 제3자로부터 무상으로 제공받은 유료 콘텐츠, 청약철회 요청 당시 이미 사용하였거나 사용한 것으로 간주되는 유료 콘텐츠 등 이에 준하는 특성을 가진 일부 유료 콘텐츠에 대하여는 관련 법령에 따라 청약철회(구매취소)가 제한될 수 있습니다. 이 경우 회사는 회원이 해당 유료 콘텐츠 구매 시 고지하는 등 관련 법령에서 정한 바에 따른 조치를 취하기로 합니다.\n2) 다음과 같은 경우 유료 콘텐츠의 청약철회가 제한되며 회사는 청약철회가 제한되는 유료 콘텐츠에 대해서 결제 전에 청약철회가 제한됨을 표시합니다.\n1. 구매 후 즉시 사용이 시작되거나 즉시 애플리케이션에 적용되는 아이템의 경우\n2. 애플리케이션의 정상적인 이용과정에서 결제 없이 획득한 아이템의 경우\n3. 추가적인 혜택이 제공되는 아이템에서 해당 추가 혜택이 사용된 경우\n4. 묶음 형으로 판매된 아이템의 일부가 사용된 경우\n5. 개봉행위를 사용으로 볼 수 있거나 개봉 시 효용이 결정되는 캡슐형/확률형 아이템의 경우\n3) 환불은 서비스를 사용하고 있는 단말기의 운영체제 종류에 따라 각 결제업체의 환불 운영정책에 따라 진행됩니다.\n4) 회원이 실제 정상적인 구매내역이 기록되는 이용대금의 결제를 통하지 않고 게임 서비스 중에 보상으로 취득하거나, 회사가 내부 이벤트 혹은 외부 제휴 이벤트 등을 통하여 지급한 유료 콘텐츠는 환불하지 않습니다.\n5) 청약철회 및 환불 등을 요구할 경우에는 회사 고객센터를 통해 별도의 개인정보 취급 동의 과정을 거친 후 회사의 구매내역 확인에 의해 진행되며, 이 과정 중 플랫폼사업자 또는 결제업체의 통해 구매내역을 확인하는 절차를 거친 다음 진행됩니다. 회사는 이 과정 중에서 회원의 정당한 철회 사유를 확인하기 위해 필요 시 회원에게서 제공받은 정보를 통해 회원에게 연락하여 정확한 사실 확인을 할 수 있으며, 추가적으로 증빙을 요구할 수 있습니다.\n6) 애플리케이션에서 판매되는 유료 콘텐츠를 미성년자가 법정대리인의 동의 없이 결제한 경우, 미성년자 또는 법정대리인은 결제를 취소할 수 있습니다. 단, 미성년자의 유료 콘텐츠 결제가 법정대리인으로부터 처분을 허락 받은 재산의 범위 내인 경우 또는 미성년자가 사술 등을 사용하여 성년자로 믿게 한 때에는 취소가 제한됩니다. 유료 콘텐츠 구매자가 미성년자인지 여부는 결제가 진행된 단말기 또는 신용카드 등 결제수단의 명의자를 기준으로 판단됩니다. 미성년자 결제취소를 요청하시는 경우 회사의 필요에 따라 미성년자 및 법정대리인을 증명할 수 있는 서류를 제출하여야 합니다.\n7) 애플리케이션을 통한 결제는 결제업체가 제공하는 결제방식에 따릅니다. 따라서 결제 과정에서 과오금이 발생하는 경우 원칙적으로 결제업체에게 환급을 요청하여야 합니다. 단, 결제업체의 정책, 시스템에 따라 가능한 경우 회사가 결제업체에게 필요한 환급절차의 이행을 요청할 수도 있습니다.\n8) 선물하기 기능을 통하여 이루어진 유료 콘텐츠 결제에 대하여는 구매한 유료 콘텐츠에 하자가 있는 경우를 제외하고는 원칙적으로 결제 취소 및 환급이 불가하며, 유료 콘텐츠의 하자로 인한 환급은 선물을 보낸 회원에 한하여 가능합니다.\n9) 회사는 회원으로부터 환불에 필요한 관련 서류를 받은 날로부터 최대한 조속한 시일 내에 환불을 완료하도록 노력합니다.\n\n제17조 계약 해지 및 변경\n1) 회원은 언제든지 서비스 이용을 원하지 않는 경우 회원본인이 회원탈퇴를 통해 계약을 해지할 수 있습니다. 탈퇴는 즉시 처리되며 탈퇴 시 회원이 보유한 콘텐츠 정보는 모두 삭제되어 복구가 불가능합니다.\n2) 회사는 회원이 서비스 이용 내용에 있어서 다음 각 호에 해당하는 경우 회사의 이용제한 규정에 따라 이용제한 및 이용 계약을 해지할 수 있습니다.\n1. 서비스 신청 시에 허위 내용을 등록한 경우 \n2. 서비스 운영을 고의로 방해한 경우\n3. 타인의 서비스 아이디 및 비밀번호를 도용한 경우 \n4. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우\n5. 회사 및 회원에게 피해를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우\n6. 그 외 서비스정책에 위배되는 사항\n3) 전항의 규정에 따라 이용계약을 해지하거나 중단하는 경우 회원은 콘텐츠를 사용할 수 없으며, 콘텐츠 구매 대금은 반환 받을 수 없습니다.\n\n제18조 손해배상\n1) 회사는 회사가 제공하는 무료 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다. 다만, 회사의 귀책사유로 인한 것일 경우에는 회원이 입은 손해에 대해 배상합니다.\n2) 회사가 개별서비스 제공자와 제휴 계약을 맺고 회원에게 개별서비스를 제공함에 있어 회원이 개별서비스 이용약관에 동의를 한 뒤 개별서비스 제공자의 귀책 사유로 인해 손해가 발생할 경우 관련 손해에 대해서는 개별서비스 제공자가 책임을 집니다.\n\n제19조 면책 조항\n1) 회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.\n2) 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.\n3) 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다\n4) 회사는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.\n5) 회사는 회원의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.\n6) 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.\n7) 회사는 회원의 게임상 사이버 자산(게임 머니), 등급 손실에 대하여 책임을 지지 않습니다.\n8) 회사는 회원이 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.\n또한 회사는 회원이 서비스를 이용하며 타 회원으로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을 지지 않습니다.\n9) 회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.\n10) 회사는 회원 상호간 및 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.\n11) 회사에서 회원에게 무료로 제공하는 서비스의 이용과 관련하여 발생하는 손해에 대해서는 책임을 지지 않습니다.\n12) 게임 아이템의 사용 유효 기간인 1년이 경과한 콘텐츠는 회사에서 사용권을 보장하지 않습니다.\n13) 회사는 서비스의 변경 및 중단에 관련하여 발생하는 문제에 대해서는 책임을 지지 않습니다.\n\n제20조 재판권 및 준거법\n1) 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 해당 규정에 따릅니다.\n2) 회사의 기타 유료 서비스 이용 회원의 경우 회사가 별도로 정한 약관 및 정책에 따릅니다.\n3) 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.\n";
    provisonText1.editable = NO;
    [_RJVC.view addSubview:provisonText1];
}
@end
