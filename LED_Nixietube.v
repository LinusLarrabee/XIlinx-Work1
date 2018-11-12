module LED_Nixietube(Sys_CLK,Data_Bin,EN,COM,SEG);

input Sys_CLK;
input EN;
input [7:0]Data_Bin;
output [1:0]COM;
output [7:0]SEG;

wire [7:0]Num_Display;
//wire [19:0]Num_BCD;
//wire [15:0]Num_Bin;

reg [7:0]SEG;
reg COM_Cnt;

reg Div_CLK;
reg [12:0]Div_Cnt;

//assign Num_Bin = {4'b0,Data_Bin};
assign Num_Display = Data_Bin;

//BinToBCD BinToBCD(.Data_Bin(Num_Bin),.Data_BCD(Num_BCD),.Sys_CLK(Sys_CLK));
/*
parameter Display_0 = 8'b11111100;
parameter Display_1 = 8'b01100000;
parameter Display_2 = 8'b11011010;
parameter Display_3 = 8'b11110010;
parameter Display_4 = 8'b01100110;
parameter Display_5 = 8'b10110110;
parameter Display_6 = 8'b10111110;
parameter Display_7 = 8'b11100000;
parameter Display_8 = 8'b11111110;
parameter Display_9 = 8'b11110110;
parameter Display_DP = 8'b00000001;
parameter Display_A = 8'b11101110;
parameter Display_B = 8'b00111110;
parameter Display_C = 8'b10011100;
parameter Display_D = 8'b01111010;
parameter Display_E = 8'b10011110;
parameter Display_F = 8'b10001110;
*/

assign COM = (EN)?((COM_Cnt)?2'b10:2'b01):2'b00;

initial
begin
	SEG <= 8'b0;
	COM_Cnt <= 1'b0;
	Div_CLK <= 1'b0;
	Div_Cnt <= 13'b0;
end

always@(posedge Sys_CLK)
begin
	if(Div_Cnt < 13'd5000)
		Div_Cnt = Div_Cnt + 1'b1;
	else
	begin
		Div_CLK = ~Div_CLK;
		Div_Cnt = 13'b0;
	end
end


wire A,B,C,D;
assign A = Num_Display[3];
assign B = Num_Display[2];
assign C = Num_Display[1];
assign D = Num_Display[0];

wire A_,B_,C_,D_;
not n1 (A_,A);
not n2 (B_,B);
not n3 (C_,C);
not n4 (D_,D);
//Y7
wire temp71,temp72,temp73,temp74;
and a71 (temp71,A_,B_,C_,D);
and a72 (temp72,A_,B,C_,D_);
and a73 (temp73,A,B_,C,D);
and a74 (temp74,A,B,C_,D);

wire Y7;
or o71 (Y7,temp71,temp72,temp73,temp74);
//Y6
wire temp61,temp62,temp63,temp64,temp65,temp66;
and a61 (temp61,A_,B,C_,D);
and a62 (temp62,A_,B,C,D_);
and a63 (temp63,A,B_,C,D);
and a64 (temp64,A,B,C_,D_);
and a65 (temp65,A,B,C,D_);
and a66 (temp66,A,B,C,D);

wire Y6;
or o61 (Y6,temp61,temp62,temp63,temp64,temp65,temp66);
//Y5
wire temp51,temp52,temp53,temp54;
and a51 (temp51,A_,B_,C,D_);
and a52 (temp52,A,B,C_,D_);
and a53 (temp53,A,B,C,D_);
and a54 (temp54,A,B,C,D);

wire Y5;
or o51 (Y5,temp51,temp52,temp53,temp54);

//Y4
wire temp41,temp42,temp43,temp44,temp45;
and a41 (temp41,A_,B_,C_,D);
and a42 (temp42,A_,B,C_,D_);
and a43 (temp43,A_,B,C,D);
and a44 (temp44,A,B_,C,D_);
and a45 (temp45,A,B,C,D);


wire Y4;
or o41 (Y4,temp41,temp42,temp43,temp44,temp45);
//Y3
wire temp31,temp32,temp33,temp34,temp35,temp36;
and a31 (temp31,A_,B_,C_,D);
and a32 (temp32,A_,B_,C,D);
and a33 (temp33,A_,B,C_,D_);
and a34 (temp34,A_,B,C_,D);
and a35 (temp35,A_,B,C,D);
and a36 (temp36,A,B_,C_,D);

wire Y3;
or o31 (Y3,temp31,temp32,temp33,temp34,temp35,temp36);
//Y2
wire temp21,temp22,temp23,temp2,temp25;
and a21 (temp21,A_,B_,C_,D);
and a22 (temp22,A_,B_,C,D_);
and a23 (temp23,A_,B_,C,D);
and a24 (temp24,A_,B,C,D);
and a25 (temp25,A,B,C_,D);


wire Y2;
or o21 (Y2,temp21,temp22,temp23,temp24,temp25);
//Y1
wire temp11,temp12,temp13,temp14;
and a11 (temp11,A_,B_,C_,D_);
and a12 (temp12,A_,B_,C_,D);
and a13 (temp13,A_,B,C,D);
and a14 (temp14,A,B,C_,D_);

wire Y1;
or o11 (Y1,temp11,temp12,temp13,temp14);


//Nixietube2 
wire E,F,G,H;
assign E = Num_Display[7];
assign F = Num_Display[6];
assign G = Num_Display[5];
assign H = Num_Display[4];

wire E_,F_,G_,H_;
not n1_ (E_,E);
not n2_ (F_,F);
not n3_ (G_,G);
not n4_ (H_,H);
//Y7_
wire temp7_1_,temp7_2_,temp7_3_,temp7_4_;
and a7_1_ (temp7_1_,E_,F_,G_,H);
and a7_2_ (temp7_2_,E_,F,G_,H_);
and a7_3_ (temp7_3_,E,F_,G,H);
and a7_4_ (temp7_4_,E,F,G_,H);

wire Y7_;
or o7_1_ (Y7_,temp7_1_,temp7_2_,temp7_3_,temp7_4_);
//Y6_
wire temp6_1_,temp6_2_,temp6_3_,temp6_4_,temp6_5_,temp6_6_;
and a6_1_ (temp6_1_,E_,F,G_,H);
and a6_2_ (temp6_2_,E_,F,G,H_);
and a6_3_ (temp6_3_,E,F_,G,H);
and a6_4_ (temp6_4_,E,F,G_,H_);
and a6_5_ (temp6_5_,E,F,G,H_);
and a6_6_ (temp6_6_,E,F,G,H);

wire Y6_;
or o6_1_ (Y6_,temp6_1_,temp6_2_,temp6_3_,temp6_4_,temp6_5_,temp6_6_);
//Y5_
wire temp5_1_,temp5_2_,temp5_3_,temp5_4_;
and a5_1_ (temp5_1_,E_,F_,G,H_);
and a5_2_ (temp5_2_,E,F,G_,H_);
and a5_3_ (temp5_3_,E,F,G,H_);
and a5_4_ (temp5_4_,E,F,G,H);

wire Y5_;
or o5_1_ (Y5_,temp5_1_,temp5_2_,temp5_3_,temp5_4_);

//Y4_
wire temp4_1_,temp4_2_,temp4_3_,temp4_4_,temp4_5_;
and a4_1_ (temp4_1_,E_,F_,G_,H);
and a4_2_ (temp4_2_,E_,F,G_,H_);
and a4_3_ (temp4_3_,E_,F,G,H);
and a4_4_ (temp4_4_,E,F_,G,H_);
and a4_5_ (temp4_5_,E,F,G,H);


wire Y4_;
or o4_1_ (Y4_,temp4_1_,temp4_2_,temp4_3_,temp4_4_,temp4_5_);
//Y3_
wire temp3_1_,temp3_2_,temp3_3_,temp3_4_,temp3_5_,temp3_6_;
and a3_1_ (temp3_1_,E_,F_,G_,H);
and a3_2_ (temp3_2_,E_,F_,G,H);
and a3_3_ (temp3_3_,E_,F,G_,H_);
and a3_4_ (temp3_4_,E_,F,G_,H);
and a3_5_ (temp3_5_,E_,F,G,H);
and a3_6_ (temp3_6_,E,F_,G_,H);

wire Y3_;
or o3_1_ (Y3_,temp3_1_,temp3_2_,temp3_3_,temp3_4_,temp3_5_,temp3_6_);
//Y2_
wire temp2_1_,temp2_2_,temp2_3_,temp2_,temp2_5_;
and a2_1_ (temp2_1_,E_,F_,G_,H);
and a2_2_ (temp2_2_,E_,F_,G,H_);
and a2_3_ (temp2_3_,E_,F_,G,H);
and a2_4_ (temp2_4_,E_,F,G,H);
and a2_5_ (temp2_5_,E,F,G_,H);


wire Y2_;
or o2_1_ (Y2_,temp2_1_,temp2_2_,temp2_3_,temp2_4_,temp2_5_);
//Y1_
wire temp1_1_,temp1_2_,temp1_3_,temp1_4_;
and a1_1_ (temp1_1_,E_,F_,G_,H_);
and a1_2_ (temp1_2_,E_,F_,G_,H);
and a1_3_ (temp1_3_,E_,F,G,H);
and a1_4_ (temp1_4_,E,F,G_,H_);

wire Y1_;
or o1_1_ (Y1_,temp1_1_,temp1_2_,temp1_3_,temp1_4_);
always@(posedge Div_CLK)
begin
	if(EN)
	begin
		if(COM_Cnt)
		begin
			SEG[7] <= ~Y7_;
			SEG[6] <= ~Y6_;
			SEG[5] <= ~Y5_;
			SEG[4] <= ~Y4_;
			SEG[3] <= ~Y3_;
			SEG[2] <= ~Y2_;
			SEG[1] <= ~Y1_;
			SEG[0] <= 1'b0;
		end
		else
		begin
			SEG[7] <= ~Y7;
			SEG[6] <= ~Y6;
			SEG[5] <= ~Y5;
			SEG[4] <= ~Y4;
			SEG[3] <= ~Y3;
			SEG[2] <= ~Y2;
			SEG[1] <= ~Y1;
			SEG[0] <= 1'b0;
		end
		COM_Cnt = COM_Cnt + 1'b1;
	end
	else 
		COM_Cnt = 1'b0;
end
/*
always@(posedge Div_CLK)
begin
	if(EN)
	begin
		if(COM_Cnt)
		begin
			case(Num_Display[7:4])
				4'h0:SEG <= Display_0+1'b1;
				4'h1:SEG <= Display_1+1'b1;
				4'h2:SEG <= Display_2+1'b1;
				4'h3:SEG <= Display_3+1'b1;
				4'h4:SEG <= Display_4+1'b1;
				4'h5:SEG <= Display_5+1'b1;
				4'h6:SEG <= Display_6+1'b1;
				4'h7:SEG <= Display_7+1'b1;
				4'h8:SEG <= Display_8+1'b1;
				4'h9:SEG <= Display_9+1'b1;
				4'hA:SEG <= Display_A+1'b1;
				4'hB:SEG <= Display_B+1'b1;
				4'hC:SEG <= Display_C+1'b1;
				4'hD:SEG <= Display_D+1'b1;
				4'hE:SEG <= Display_E+1'b1;
				4'hF:SEG <= Display_F+1'b1;
				default:SEG <= 4'h0;
			endcase
		end
		else
		begin
			case(Num_Display[3:0])
				4'h0:SEG <= Display_0;
				4'h1:SEG <= Display_1;
				4'h2:SEG <= Display_2;
				4'h3:SEG <= Display_3;
				4'h4:SEG <= Display_4;
				4'h5:SEG <= Display_5;
				4'h6:SEG <= Display_6;
				4'h7:SEG <= Display_7;
				4'h8:SEG <= Display_8;
				4'h9:SEG <= Display_9;
				4'hA:SEG <= Display_A;
				4'hB:SEG <= Display_B;
				4'hC:SEG <= Display_C;
				4'hD:SEG <= Display_D;
				4'hE:SEG <= Display_E;
				4'hF:SEG <= Display_F;
				default:SEG <= 4'h0;
			endcase
		end
		COM_Cnt = COM_Cnt + 1'b1;
	end
	else 
		COM_Cnt = 1'b0;
end
*/
endmodule