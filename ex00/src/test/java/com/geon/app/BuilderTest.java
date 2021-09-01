package com.geon.app;

public class BuilderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Member member = Member.builder()
						.id("aa")
						.pw("aaa")
						.build();
	}

}
