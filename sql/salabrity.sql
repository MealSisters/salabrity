--==============================================
-- 강의장 DB 계정생성 내용
--==============================================
--alter session set "_oracle_script" = true; -- c##으로 시작하지 않는 일반계정생성 허용
--
--create user salabrity
--identified by salabrity0624
--default tablespace users;
--
--grant connect, resource, create view to salabrity;
--
--alter user salabrity quota unlimited on users;



--==============================================
-- salabrity 계정
--==============================================
-- ---------------------------------------------
-- 테이블/시퀀스 삭제 코드
-- ---------------------------------------------
--drop table chat;
--drop sequence seq_chat_no;
--drop table chatroom;
--drop sequence seq_chatroom_no;
--drop table product_buy;
--drop sequence seq_product_buy_no;
--drop table buy;
--drop sequence seq_buy_no;
--drop table cart;
--drop sequence seq_cart_no;
--drop table shipping_address;
--drop sequence seq_shipping_address_no;
--drop table posting_comment;
--drop sequence seq_comment_no;
--drop table posting_attach;
--drop sequence seq_posting_attach_no;
--drop table posting;
--drop sequence seq_posting_no;
--drop table board_category;
--drop table member;
--drop table calendar;
--drop sequence seq_calendar_no;
--drop table product_menu;
--drop table menu_attach;
--drop sequence seq_menu_attach_no;
--drop table menu;
--drop sequence seq_menu_no;
--drop table product_attach;
--drop sequence seq_product_attach_no;
--drop table product;
--drop sequence seq_product_no;


-- =================================================
-- 테이블 / 시퀀스 생성
-- =================================================
create table product (
	product_no number,
	product_id varchar2(30) not null,
	product_name varchar2(255) not null,
	product_price number not null,
	product_description varchar2(255) not null,
	product_target varchar2(20) not null,
	views number default 0,
	sales_cnt number default 0,
	registration_date date default sysdate,
	subscription_period number default 1,
    del_flag char(1) default 'N',
    
    constraint pk_product_no primary key(product_no),
    constraint uq_product_id unique(product_id),
    constraint ck_product_target check (product_target in ('dieter','diabetic','baby','ordinary')),
    constraint ck_product_del_flag check (del_flag in ('Y', 'N'))
);
create sequence seq_product_no;


create table product_attach (
	product_attach_no number,
	product_no number not null,
	thumbnail char(2) not null,
	original_filename varchar2(255),
	renamed_filename varchar2(255),
	reg_date date default sysdate,
    
    constraint pk_product_attach primary key(product_attach_no),
    constraint fk_product_attach_product_no foreign key(product_no) references product(product_no) on delete cascade, --상품삭제시 상품첨부파일정보도 삭제(은지)
    constraint ck_product_attach_thumbnail check(thumbnail in ('Y', 'N1', 'N2')) -- Y:썸네일,  N1:상세이미지1,  N2:상세이미지2 (은지)
);
create sequence seq_product_attach_no;


create table menu (
    menu_no number,
	menu_id varchar(30) not null,
	menu_name varchar(255) not null,
	menu_description varchar(4000) not null,
	ingredients varchar2(2000) not null,
    calorie number not null,
    
    constraint pk_menu_no primary key(menu_no),
    constraint uk_menu_id unique(menu_id)
);
create sequence seq_menu_no;


create table menu_attach (
	menu_attach_no number,
	menu_no number not null,
	original_filename varchar2(255),
    renamed_filename varchar2(255),
    reg_date date default sysdate,
    
    constraint pk_menu_attach primary key(menu_attach_no),
    constraint fk_menu_attach_menu_no foreign key(menu_no) references menu(menu_no) on delete cascade --메뉴삭제시 메뉴첨부파일정보도 삭제(은지)
);
create sequence seq_menu_attach_no;


create table product_menu (
	product_no number not null,
    menu_no number not null,
    
    constraint fk_product_menu_product_no foreign key(product_no) references product(product_no) on delete cascade, --상품삭제하면 상품-메뉴 테이블의 해당 상품 레코드들 삭제(은지)
    constraint fk_product_menu_menu_no foreign key(menu_no) references menu(menu_no) on delete cascade -- 메뉴삭제하면 상품-메뉴 테이블의 해당 메뉴 레코드들 삭제(은지)
);


create table calendar (
	cal_no number,
	product_no number not null,
	menu_no number not null,
    week_day_code varchar2(10) not null, -- W1D1, W1D2, ...
    
    constraint pk_calendar_no primary key(cal_no),
    constraint fk_calendar_product_no foreign key(product_no) references product(product_no),
    constraint fk_calendar_menu_no foreign key(menu_no) references menu(menu_no)
);
create sequence seq_calendar_no;


create table member (
	member_id varchar2(15),
	password varchar2(100) not null,
	member_name varchar2(100) not null,
	gender char(1),
	birthday date,
	email varchar2(200) not null,
	phone char(11) not null,
    zipcode char(5) not null,
	address varchar2(255) not null,
	address_detail varchar2(255),
	enroll_date date default sysdate,
	member_role char(1) default 'U',
    
    constraint pk_member_id primary key(member_id),
    constraint ck_member_gender check(gender in ('M', 'F')),
    constraint ck_member_role check(member_role in ('U', 'A')),
    constraint uq_member_email unique(email)
);


create table board_category (
	board_code varchar2(3), --'N=공지사항 C=커뮤니티 Q=문의사항,FAQ'
	board_name varchar2(300) not null,
    
    constraint pk_board_category_code primary key(board_code),
    constraint uk_board_category_name unique(board_name)
);


create table posting (
	posting_no number,
	board_code varchar2(3) not null,
	member_id varchar2(15) not null,
	title varchar2(1000) not null,
	content varchar2(4000) not null,
    reg_date date default sysdate,
	read_count number default 0,
	like_count number default 0,
	posting_level number default 1, -- 일반 게시글=1    답 게시글(예: 관리자답변)=2
	posting_ref number,
    
    constraint pk_posting_no primary key(posting_no),
    constraint fk_posting_board_code foreign key(board_code) references board_category(board_code) on delete cascade, --게시판 삭제되면 해당 레코드도 삭제(은지)
    constraint fk_posting_member_id foreign key(member_id) references member(member_id) on delete set null, -- 회원이 탈퇴하면 해당 레코드 member_id는 null로 처리(은지)
    constraint fk_posting_ref foreign key(posting_ref) references posting(posting_no) on delete cascade -- 원본글 삭제시 답게시글도 삭제(은지)
);
create sequence seq_posting_no;


create table posting_attach (
	posting_attach_no number,
	posting_no number not null,
	board_code varchar2(3) not null,
	original_filename varchar2(255),
	renamed_filename varchar2(255),
	reg_date date default sysdate,

    constraint pk_posting_attach_no primary key(posting_attach_no),
    constraint fk_posting_attach_posting_no foreign key(posting_no) references posting(posting_no) on delete cascade, -- 게시글 삭제시 첨부파일정보도 삭제(은지)
    constraint fk_posting_attach_board_code foreign key(board_code) references board_category(board_code) on delete cascade --게시판 삭제되면 해당 레코드도 삭제(은지)
);
create sequence seq_posting_attach_no;


create table posting_comment (
	comment_no number,
	posting_no number not null,
	board_code varchar2(3) not null,
	member_id varchar2(15) not null,
	comment_content varchar2(2000) not null,
    comment_level number default 1,
	comment_ref number,
	reg_date date default sysdate,
    
    constraint pk_comment_no primary key(comment_no),
    constraint fk_comment_posting_no foreign key(posting_no) references posting(posting_no) on delete cascade, -- 원본글 삭제시 댓글도 삭제(은지)
    constraint fk_comment_board_code foreign key(board_code) references board_category(board_code) on delete cascade, --게시판 삭제되면 해당 레코드도 삭제(은지)
    constraint fk_comment_member_id foreign key(member_id) references member(member_id) on delete set null, -- 회원이 탈퇴하면 해당 레코드 member_id는 null로 처리(은지)
    constraint fk_comment_ref foreign key(comment_ref) references posting_comment(comment_no) on delete set null -- 원본댓글 삭제시 답댓글의 참조댓번호 null로 변경(은지)
);
create sequence seq_comment_no;


create table shipping_address (
	shipping_address_no number, --일단 시퀀스 만들어뒀는데 시퀀스로 사용하실게 맞을까요?(은지)
	member_id varchar2(15) not null,
	telephone char(11) not null,
	zipcode char(5) not null,
	address varchar(255) not null,
	address_detail varchar(255),
	is_default char(1) default 'Y',
	shipping_person varchar(50),
    del_flag char(1) default 'N',
    
    constraint pk_shipping_address_no primary key(shipping_address_no),
    constraint fk_shipping_address_member_id foreign key(member_id) references member(member_id) on delete cascade, -- 회원이 탈퇴하면 해당 배송지정보 레코드도 삭제(은지)
    constraint ck_shipping_address_default check(is_default in ('Y', 'N')),
    constraint ck_shipping_address_del_flag check(del_flag in ('Y', 'N'))
);
create sequence seq_shipping_address_no;


create table cart (
	cart_no number,
	member_id varchar2(15) not null,
	product_no number not null,
	quantity number default 1,
	order_flag char(1) default 'N', -- 주문전에는 N, 주문하고나면 Y
    
    constraint pk_cart_no primary key(cart_no),
    constraint fk_cart_member_id foreign key(member_id) references member(member_id) on delete cascade, -- 회원이 탈퇴하면 해당 장바구니 레코드도 삭제(은지)
    constraint fk_cart_product_no foreign key(product_no) references product(product_no) on delete cascade, -- 상품이 완전히 삭제되면 장바구니 레코드도 삭제(은지)
    constraint ck_cart_order_flag check(order_flag in ('N', 'Y'))
);
create sequence seq_cart_no;


create table buy (
	merchant_uid number,
	member_id varchar2(15) not null,
	shipping_address_no number not null,
    pay_method varchar2(15) not null,
    amount number not null,
    buyer_email varchar2(200) not null,
    buyer_name varchar2(100) not null,
    buyer_tel char(11) not null,
    buyer_addr varchar2(1000) not null,
    buyer_postcode char(5) not null,
    payment_date date not null, --결제일
    buy_date date not null, --주문일
    imp_uid varchar2(100) not null,
    pay_statement char(20) not null,
    request_term varchar2(500),
    
    constraint pk_buy_merchant_uid primary key(merchant_uid),
    constraint fk_buy_member_id foreign key(member_id) references member(member_id) on delete set null, -- 회원이 탈퇴하면 해당 레코드 member_id는 null로 처리(은지)
    constraint fk_buy_shipping_address_no foreign key(shipping_address_no) references shipping_address(shipping_address_no) on delete set null -- 배송지정보 삭제 시 해당 레코드의 shipping_address_num은 null로 처리(은지)
);
create sequence seq_buy_no;


create table product_buy (
    product_buy_no number,
	product_no number not null,
	merchant_uid number not null,
    quantity number not null,
    first_shipping_date date not null,
    cancel_flag char(1) default 'N',
    
    constraint pk_product_buy_no primary key(product_buy_no),
    constraint fk_product_buy_product_no foreign key(product_no) references product(product_no) on delete cascade, -- 맞나요..?(은지)
    constraint fk_product_buy_merchant_uid foreign key(merchant_uid) references buy(merchant_uid) on delete cascade, -- 맞나요..?(은지)
    constraint ck_product_buy_cancel_flag check(cancel_flag in ('Y', 'N'))
);
create sequence seq_product_buy_no;



create table chatroom (
    chatroom_no number,
    member_id varchar2(15),
    
    constraint pk_chatroom_no primary key(chatroom_no, member_id),
    constraint fk_chatroom_member_id foreign key(member_id) references member(member_id) on delete set null
);
create sequence seq_chatroom_no;


create table chat (
    chat_no number,
    chatroom_no number not null,
    member_id varchar2(15) not null,
    chat_content varchar2(1000) not null,
    
    constraint pk_chat_no primary key(chat_no),
    constraint fk_chat_member_id foreign key(member_id) references member(member_id) on delete set null
);
create sequence seq_chat_no;


-- =================================================
-- 샘플데이터
-- =================================================

select * from member;