module gcd (clk,
    req_rdy,
    req_val,
    reset,
    resp_rdy,
    resp_val,
    req_msg,
    resp_msg);
 input clk;
 output req_rdy;
 input req_val;
 input reset;
 input resp_rdy;
 output resp_val;
 input [31:0] req_msg;
 output [15:0] resp_msg;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _103_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire \ctrl$a_reg_en[0] ;
 wire \ctrl$b_reg_en[0] ;
 wire \ctrl.state.out[1] ;
 wire \ctrl.state.out[2] ;
 wire \dpath.a_lt_b$in0[0] ;
 wire \dpath.a_lt_b$in0[10] ;
 wire \dpath.a_lt_b$in0[11] ;
 wire \dpath.a_lt_b$in0[12] ;
 wire \dpath.a_lt_b$in0[13] ;
 wire \dpath.a_lt_b$in0[14] ;
 wire \dpath.a_lt_b$in0[15] ;
 wire \dpath.a_lt_b$in0[1] ;
 wire \dpath.a_lt_b$in0[2] ;
 wire \dpath.a_lt_b$in0[3] ;
 wire \dpath.a_lt_b$in0[4] ;
 wire \dpath.a_lt_b$in0[5] ;
 wire \dpath.a_lt_b$in0[6] ;
 wire \dpath.a_lt_b$in0[7] ;
 wire \dpath.a_lt_b$in0[8] ;
 wire \dpath.a_lt_b$in0[9] ;
 wire \dpath.a_lt_b$in1[0] ;
 wire \dpath.a_lt_b$in1[10] ;
 wire \dpath.a_lt_b$in1[11] ;
 wire \dpath.a_lt_b$in1[12] ;
 wire \dpath.a_lt_b$in1[13] ;
 wire \dpath.a_lt_b$in1[14] ;
 wire \dpath.a_lt_b$in1[15] ;
 wire \dpath.a_lt_b$in1[1] ;
 wire \dpath.a_lt_b$in1[2] ;
 wire \dpath.a_lt_b$in1[3] ;
 wire \dpath.a_lt_b$in1[4] ;
 wire \dpath.a_lt_b$in1[5] ;
 wire \dpath.a_lt_b$in1[6] ;
 wire \dpath.a_lt_b$in1[7] ;
 wire \dpath.a_lt_b$in1[8] ;
 wire \dpath.a_lt_b$in1[9] ;
 wire \dpath.a_mux$out[0] ;
 wire \dpath.a_mux$out[10] ;
 wire \dpath.a_mux$out[11] ;
 wire \dpath.a_mux$out[12] ;
 wire \dpath.a_mux$out[13] ;
 wire \dpath.a_mux$out[14] ;
 wire \dpath.a_mux$out[15] ;
 wire \dpath.a_mux$out[1] ;
 wire \dpath.a_mux$out[2] ;
 wire \dpath.a_mux$out[3] ;
 wire \dpath.a_mux$out[4] ;
 wire \dpath.a_mux$out[5] ;
 wire \dpath.a_mux$out[6] ;
 wire \dpath.a_mux$out[7] ;
 wire \dpath.a_mux$out[8] ;
 wire \dpath.a_mux$out[9] ;
 wire \dpath.b_mux$out[0] ;
 wire \dpath.b_mux$out[10] ;
 wire \dpath.b_mux$out[11] ;
 wire \dpath.b_mux$out[12] ;
 wire \dpath.b_mux$out[13] ;
 wire \dpath.b_mux$out[14] ;
 wire \dpath.b_mux$out[15] ;
 wire \dpath.b_mux$out[1] ;
 wire \dpath.b_mux$out[2] ;
 wire \dpath.b_mux$out[3] ;
 wire \dpath.b_mux$out[4] ;
 wire \dpath.b_mux$out[5] ;
 wire \dpath.b_mux$out[6] ;
 wire \dpath.b_mux$out[7] ;
 wire \dpath.b_mux$out[8] ;
 wire \dpath.b_mux$out[9] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net36;
 wire net33;
 wire net34;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net35;
 wire net53;
 wire net157;
 wire net153;
 wire net130;
 wire net127;
 wire net128;
 wire net129;
 wire net131;
 wire net132;
 wire net151;
 wire net133;
 wire net134;
 wire net135;
 wire net366;
 wire net150;
 wire net137;
 wire net138;
 wire net144;
 wire net142;
 wire net140;
 wire net139;
 wire net141;
 wire net143;
 wire net147;
 wire net145;
 wire net146;
 wire net148;
 wire net149;
 wire net152;
 wire net154;
 wire net155;
 wire net156;
 wire net368;
 wire net160;
 wire net161;
 wire net330;
 wire net166;
 wire net167;
 wire net168;
 wire net169;
 wire net170;
 wire net171;
 wire net172;
 wire net287;
 wire net175;
 wire net176;
 wire net178;
 wire net190;
 wire net180;
 wire net181;
 wire net182;
 wire net184;
 wire net185;
 wire net186;
 wire net187;
 wire net188;
 wire net189;
 wire net191;
 wire net192;
 wire net193;
 wire net194;
 wire net195;
 wire net196;
 wire net198;
 wire clknet_2_0__leaf_clk;
 wire net199;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_0_clk;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net158;
 wire net164;
 wire net165;
 wire net173;
 wire net179;
 wire net197;
 wire clknet_2_3__leaf_clk;
 wire net200;
 wire net201;
 wire net202;
 wire net203;
 wire net204;
 wire net339;
 wire net206;
 wire net207;
 wire net344;
 wire net212;
 wire net214;
 wire net215;
 wire net216;
 wire net245;
 wire net248;
 wire net288;
 wire net289;
 wire net290;
 wire net292;
 wire net331;
 wire net332;
 wire net337;
 wire net338;
 wire net341;
 wire net342;
 wire net345;

 sky130_fd_sc_hd__nor4_4 _157_ (.A(net330),
    .B(net168),
    .C(net169),
    .D(net167),
    .Y(_004_));
 sky130_fd_sc_hd__nor4_4 _158_ (.A(net368),
    .B(net172),
    .C(net173),
    .D(net170),
    .Y(_005_));
 sky130_fd_sc_hd__nor4_4 _159_ (.A(net175),
    .B(net166),
    .C(net292),
    .D(net179),
    .Y(_006_));
 sky130_fd_sc_hd__nor4_4 _160_ (.A(net180),
    .B(net181),
    .C(net182),
    .D(net165),
    .Y(_007_));
 sky130_fd_sc_hd__nand4_1 _161_ (.A(_006_),
    .B(_004_),
    .C(_005_),
    .D(_007_),
    .Y(_008_));
 sky130_fd_sc_hd__a22oi_1 _162_ (.A1(net288),
    .A2(net199),
    .B1(_008_),
    .B2(net195),
    .Y(_009_));
 sky130_fd_sc_hd__nor2_1 _163_ (.A(net198),
    .B(_009_),
    .Y(_002_));
 sky130_fd_sc_hd__inv_1 _164_ (.A(\ctrl.state.out[1] ),
    .Y(_010_));
 sky130_fd_sc_hd__or2_4 _165_ (.A(\ctrl.state.out[2] ),
    .B(net36),
    .X(\ctrl$a_reg_en[0] ));
 sky130_fd_sc_hd__nor2_4 _166_ (.A(\ctrl$a_reg_en[0] ),
    .B(_010_),
    .Y(net53));
 sky130_fd_sc_hd__inv_1 _167_ (.A(net33),
    .Y(_011_));
 sky130_fd_sc_hd__a221o_1 _168_ (.A1(net288),
    .A2(_011_),
    .B1(net35),
    .B2(net53),
    .C1(net34),
    .X(_000_));
 sky130_fd_sc_hd__inv_1 _169_ (.A(net35),
    .Y(_012_));
 sky130_fd_sc_hd__o21ai_0 _170_ (.A1(net288),
    .A2(_012_),
    .B1(\ctrl.state.out[1] ),
    .Y(_013_));
 sky130_fd_sc_hd__a21bo_2 _171_ (.A1(_008_),
    .A2(net161),
    .B1_N(net195),
    .X(_014_));
 sky130_fd_sc_hd__a21oi_2 _172_ (.A1(_014_),
    .A2(_013_),
    .B1(net198),
    .Y(_001_));
 sky130_fd_sc_hd__xor2_1 _173_ (.A(net194),
    .B(net330),
    .X(net37));
 sky130_fd_sc_hd__nor2b_4 _174_ (.A(\dpath.a_lt_b$in0[0] ),
    .B_N(\dpath.a_lt_b$in1[0] ),
    .Y(_015_));
 sky130_fd_sc_hd__xnor2_4 _175_ (.A(net188),
    .B(net368),
    .Y(_016_));
 sky130_fd_sc_hd__xnor2_2 _176_ (.A(net337),
    .B(_016_),
    .Y(net44));
 sky130_fd_sc_hd__inv_1 _177_ (.A(\dpath.a_lt_b$in0[1] ),
    .Y(_017_));
 sky130_fd_sc_hd__maj3_2 _178_ (.A(_015_),
    .B(\dpath.a_lt_b$in1[1] ),
    .C(_017_),
    .X(_018_));
 sky130_fd_sc_hd__xnor2_1 _179_ (.A(net173),
    .B(net187),
    .Y(_019_));
 sky130_fd_sc_hd__xnor2_4 _180_ (.A(_019_),
    .B(net142),
    .Y(net45));
 sky130_fd_sc_hd__nor2b_1 _181_ (.A(\dpath.a_lt_b$in0[3] ),
    .B_N(\dpath.a_lt_b$in1[3] ),
    .Y(_020_));
 sky130_fd_sc_hd__nand2b_1 _182_ (.A_N(\dpath.a_lt_b$in1[3] ),
    .B(\dpath.a_lt_b$in0[3] ),
    .Y(_021_));
 sky130_fd_sc_hd__nor2b_1 _183_ (.A(_020_),
    .B_N(_021_),
    .Y(_022_));
 sky130_fd_sc_hd__inv_1 _184_ (.A(\dpath.a_lt_b$in0[2] ),
    .Y(_023_));
 sky130_fd_sc_hd__maj3_4 _185_ (.A(_018_),
    .B(\dpath.a_lt_b$in1[2] ),
    .C(_023_),
    .X(_024_));
 sky130_fd_sc_hd__xnor2_4 _186_ (.A(_022_),
    .B(net200),
    .Y(net46));
 sky130_fd_sc_hd__a21oi_4 _187_ (.A1(_024_),
    .A2(_021_),
    .B1(_020_),
    .Y(_025_));
 sky130_fd_sc_hd__xor2_1 _188_ (.A(net170),
    .B(net186),
    .X(_026_));
 sky130_fd_sc_hd__xnor2_1 _189_ (.A(_026_),
    .B(net137),
    .Y(net47));
 sky130_fd_sc_hd__nand2b_1 _190_ (.A_N(\dpath.a_lt_b$in1[5] ),
    .B(\dpath.a_lt_b$in0[5] ),
    .Y(_027_));
 sky130_fd_sc_hd__nand2b_1 _191_ (.A_N(\dpath.a_lt_b$in0[5] ),
    .B(\dpath.a_lt_b$in1[5] ),
    .Y(_028_));
 sky130_fd_sc_hd__nand2_1 _192_ (.A(_027_),
    .B(_028_),
    .Y(_029_));
 sky130_fd_sc_hd__nor2_1 _193_ (.A(net137),
    .B(net186),
    .Y(_030_));
 sky130_fd_sc_hd__nand2_1 _194_ (.A(net186),
    .B(net137),
    .Y(_031_));
 sky130_fd_sc_hd__o21ai_2 _195_ (.A1(_030_),
    .A2(net170),
    .B1(_031_),
    .Y(_032_));
 sky130_fd_sc_hd__xnor2_2 _196_ (.A(net135),
    .B(_029_),
    .Y(net48));
 sky130_fd_sc_hd__nor2b_1 _197_ (.A(\dpath.a_lt_b$in1[5] ),
    .B_N(\dpath.a_lt_b$in0[5] ),
    .Y(_033_));
 sky130_fd_sc_hd__o21ai_1 _198_ (.A1(_033_),
    .A2(net245),
    .B1(_028_),
    .Y(_034_));
 sky130_fd_sc_hd__xnor2_1 _199_ (.A(\dpath.a_lt_b$in1[6] ),
    .B(\dpath.a_lt_b$in0[6] ),
    .Y(_035_));
 sky130_fd_sc_hd__xnor2_1 _200_ (.A(net158),
    .B(_034_),
    .Y(net49));
 sky130_fd_sc_hd__inv_1 _201_ (.A(\dpath.a_lt_b$in0[4] ),
    .Y(_036_));
 sky130_fd_sc_hd__nand3_1 _202_ (.A(_027_),
    .B(_028_),
    .C(_035_),
    .Y(_037_));
 sky130_fd_sc_hd__a21oi_1 _203_ (.A1(net171),
    .A2(_036_),
    .B1(net141),
    .Y(_038_));
 sky130_fd_sc_hd__o21bai_1 _204_ (.A1(net185),
    .A2(_033_),
    .B1_N(net168),
    .Y(_039_));
 sky130_fd_sc_hd__nand2_1 _205_ (.A(net185),
    .B(_033_),
    .Y(_040_));
 sky130_fd_sc_hd__o311ai_1 _206_ (.A1(\dpath.a_lt_b$in1[4] ),
    .A2(_036_),
    .A3(_037_),
    .B1(_039_),
    .C1(_040_),
    .Y(_041_));
 sky130_fd_sc_hd__a21oi_4 _207_ (.A1(_025_),
    .A2(_038_),
    .B1(_041_),
    .Y(_042_));
 sky130_fd_sc_hd__xnor2_1 _208_ (.A(net167),
    .B(net184),
    .Y(_043_));
 sky130_fd_sc_hd__xnor2_4 _209_ (.A(net342),
    .B(_043_),
    .Y(net50));
 sky130_fd_sc_hd__nand2b_1 _210_ (.A_N(\dpath.a_lt_b$in1[7] ),
    .B(\dpath.a_lt_b$in0[7] ),
    .Y(_044_));
 sky130_fd_sc_hd__nor2b_1 _211_ (.A(\dpath.a_lt_b$in0[7] ),
    .B_N(net167),
    .Y(_045_));
 sky130_fd_sc_hd__a21oi_4 _212_ (.A1(net201),
    .A2(_044_),
    .B1(_045_),
    .Y(_046_));
 sky130_fd_sc_hd__nand2b_1 _213_ (.A_N(net166),
    .B(\dpath.a_lt_b$in0[8] ),
    .Y(_047_));
 sky130_fd_sc_hd__nand2b_1 _214_ (.A_N(\dpath.a_lt_b$in0[8] ),
    .B(net166),
    .Y(_048_));
 sky130_fd_sc_hd__nand2_1 _215_ (.A(net156),
    .B(net155),
    .Y(_049_));
 sky130_fd_sc_hd__xnor2_4 _216_ (.A(net341),
    .B(_049_),
    .Y(net51));
 sky130_fd_sc_hd__xnor2_1 _217_ (.A(\dpath.a_lt_b$in1[9] ),
    .B(\dpath.a_lt_b$in0[9] ),
    .Y(_050_));
 sky130_fd_sc_hd__a21boi_4 _218_ (.A1(net134),
    .A2(net155),
    .B1_N(net156),
    .Y(_051_));
 sky130_fd_sc_hd__xnor2_2 _219_ (.A(net154),
    .B(_051_),
    .Y(net52));
 sky130_fd_sc_hd__nor2b_1 _220_ (.A(\dpath.a_lt_b$in0[10] ),
    .B_N(\dpath.a_lt_b$in1[10] ),
    .Y(_052_));
 sky130_fd_sc_hd__nand2b_1 _221_ (.A_N(\dpath.a_lt_b$in1[10] ),
    .B(\dpath.a_lt_b$in0[10] ),
    .Y(_053_));
 sky130_fd_sc_hd__nor2b_1 _222_ (.A(_052_),
    .B_N(_053_),
    .Y(_054_));
 sky130_fd_sc_hd__nand2b_1 _223_ (.A_N(\dpath.a_lt_b$in1[9] ),
    .B(\dpath.a_lt_b$in0[9] ),
    .Y(_055_));
 sky130_fd_sc_hd__nor2b_1 _224_ (.A(\dpath.a_lt_b$in0[9] ),
    .B_N(net164),
    .Y(_056_));
 sky130_fd_sc_hd__a21oi_2 _225_ (.A1(_051_),
    .A2(_055_),
    .B1(_056_),
    .Y(_057_));
 sky130_fd_sc_hd__xor2_2 _226_ (.A(net140),
    .B(_057_),
    .X(net38));
 sky130_fd_sc_hd__nor2b_1 _227_ (.A(\dpath.a_lt_b$in0[8] ),
    .B_N(\dpath.a_lt_b$in1[8] ),
    .Y(_058_));
 sky130_fd_sc_hd__nor3_1 _228_ (.A(net151),
    .B(_056_),
    .C(net153),
    .Y(_059_));
 sky130_fd_sc_hd__inv_1 _229_ (.A(\dpath.a_lt_b$in0[9] ),
    .Y(_060_));
 sky130_fd_sc_hd__maj3_1 _230_ (.A(\dpath.a_lt_b$in1[9] ),
    .B(_060_),
    .C(net156),
    .X(_061_));
 sky130_fd_sc_hd__a21oi_1 _231_ (.A1(net152),
    .A2(_061_),
    .B1(net153),
    .Y(_062_));
 sky130_fd_sc_hd__a21oi_4 _232_ (.A1(net212),
    .A2(_059_),
    .B1(_062_),
    .Y(_063_));
 sky130_fd_sc_hd__xnor2_2 _233_ (.A(net193),
    .B(_063_),
    .Y(_064_));
 sky130_fd_sc_hd__xnor2_1 _234_ (.A(net181),
    .B(_064_),
    .Y(net39));
 sky130_fd_sc_hd__nor2b_1 _235_ (.A(\dpath.a_lt_b$in0[11] ),
    .B_N(\dpath.a_lt_b$in1[11] ),
    .Y(_065_));
 sky130_fd_sc_hd__nand2b_1 _236_ (.A_N(\dpath.a_lt_b$in1[11] ),
    .B(\dpath.a_lt_b$in0[11] ),
    .Y(_066_));
 sky130_fd_sc_hd__nand4b_1 _237_ (.A_N(_065_),
    .B(_066_),
    .C(_050_),
    .D(_054_),
    .Y(_067_));
 sky130_fd_sc_hd__nor2_1 _238_ (.A(net151),
    .B(_067_),
    .Y(_068_));
 sky130_fd_sc_hd__nor2_1 _239_ (.A(net156),
    .B(_067_),
    .Y(_069_));
 sky130_fd_sc_hd__inv_1 _240_ (.A(\dpath.a_lt_b$in0[10] ),
    .Y(_070_));
 sky130_fd_sc_hd__maj3_1 _241_ (.A(net182),
    .B(_070_),
    .C(_055_),
    .X(_071_));
 sky130_fd_sc_hd__a21oi_1 _242_ (.A1(_066_),
    .A2(_071_),
    .B1(_065_),
    .Y(_072_));
 sky130_fd_sc_hd__a211oi_4 _243_ (.A1(_046_),
    .A2(_068_),
    .B1(_069_),
    .C1(net138),
    .Y(_073_));
 sky130_fd_sc_hd__xnor2_1 _244_ (.A(net180),
    .B(net192),
    .Y(_074_));
 sky130_fd_sc_hd__xnor2_4 _245_ (.A(_074_),
    .B(net132),
    .Y(net40));
 sky130_fd_sc_hd__inv_1 _246_ (.A(\dpath.a_lt_b$in0[12] ),
    .Y(_075_));
 sky130_fd_sc_hd__maj3_2 _247_ (.A(net180),
    .B(_073_),
    .C(net148),
    .X(_076_));
 sky130_fd_sc_hd__xnor2_2 _248_ (.A(net191),
    .B(_076_),
    .Y(_077_));
 sky130_fd_sc_hd__xnor2_1 _249_ (.A(_077_),
    .B(net178),
    .Y(net41));
 sky130_fd_sc_hd__inv_1 _250_ (.A(\dpath.a_lt_b$in0[13] ),
    .Y(_078_));
 sky130_fd_sc_hd__nand2_1 _251_ (.A(_078_),
    .B(_075_),
    .Y(_079_));
 sky130_fd_sc_hd__nand2_1 _252_ (.A(\dpath.a_lt_b$in1[13] ),
    .B(_075_),
    .Y(_080_));
 sky130_fd_sc_hd__inv_1 _253_ (.A(\dpath.a_lt_b$in0[7] ),
    .Y(_081_));
 sky130_fd_sc_hd__a2111oi_4 _254_ (.A1(net167),
    .A2(_081_),
    .B1(_067_),
    .C1(_058_),
    .D1(_042_),
    .Y(_082_));
 sky130_fd_sc_hd__nand2b_1 _255_ (.A_N(_044_),
    .B(_048_),
    .Y(_083_));
 sky130_fd_sc_hd__a21oi_1 _256_ (.A1(_047_),
    .A2(_083_),
    .B1(_067_),
    .Y(_084_));
 sky130_fd_sc_hd__a2111oi_4 _257_ (.A1(_079_),
    .A2(_080_),
    .B1(_072_),
    .C1(_084_),
    .D1(net332),
    .Y(_085_));
 sky130_fd_sc_hd__nand2_1 _258_ (.A(_078_),
    .B(\dpath.a_lt_b$in1[12] ),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_1 _259_ (.A(\dpath.a_lt_b$in1[13] ),
    .B(\dpath.a_lt_b$in1[12] ),
    .Y(_087_));
 sky130_fd_sc_hd__a2111oi_4 _260_ (.A1(_086_),
    .A2(_087_),
    .B1(net138),
    .C1(_084_),
    .D1(net332),
    .Y(_088_));
 sky130_fd_sc_hd__a21oi_1 _261_ (.A1(_086_),
    .A2(_087_),
    .B1(net192),
    .Y(_089_));
 sky130_fd_sc_hd__a21o_1 _262_ (.A1(net179),
    .A2(_078_),
    .B1(_089_),
    .X(_090_));
 sky130_fd_sc_hd__nor3_2 _263_ (.A(net338),
    .B(_090_),
    .C(_085_),
    .Y(_091_));
 sky130_fd_sc_hd__xor2_1 _264_ (.A(net176),
    .B(net190),
    .X(_092_));
 sky130_fd_sc_hd__xnor2_1 _265_ (.A(_092_),
    .B(_091_),
    .Y(net42));
 sky130_fd_sc_hd__nor2b_1 _266_ (.A(\dpath.a_lt_b$in1[15] ),
    .B_N(\dpath.a_lt_b$in0[15] ),
    .Y(_093_));
 sky130_fd_sc_hd__nand2b_1 _267_ (.A_N(net189),
    .B(net175),
    .Y(_094_));
 sky130_fd_sc_hd__nor2b_1 _268_ (.A(_093_),
    .B_N(_094_),
    .Y(_095_));
 sky130_fd_sc_hd__inv_1 _269_ (.A(\dpath.a_lt_b$in0[14] ),
    .Y(_096_));
 sky130_fd_sc_hd__nor2_1 _270_ (.A(\dpath.a_lt_b$in1[14] ),
    .B(_096_),
    .Y(_097_));
 sky130_fd_sc_hd__a2111oi_4 _271_ (.A1(\dpath.a_lt_b$in1[14] ),
    .A2(_096_),
    .B1(_090_),
    .C1(_088_),
    .D1(_085_),
    .Y(_098_));
 sky130_fd_sc_hd__nor2_2 _272_ (.A(net139),
    .B(net206),
    .Y(_099_));
 sky130_fd_sc_hd__xnor2_1 _273_ (.A(_095_),
    .B(_099_),
    .Y(net43));
 sky130_fd_sc_hd__o31ai_4 _274_ (.A1(_097_),
    .A2(net206),
    .A3(_093_),
    .B1(_094_),
    .Y(_100_));
 sky130_fd_sc_hd__a21o_4 _277_ (.A1(net204),
    .A2(net195),
    .B1(net289),
    .X(\ctrl$b_reg_en[0] ));
 sky130_fd_sc_hd__nor2b_1 _278_ (.A(net289),
    .B_N(net195),
    .Y(_103_));
 sky130_fd_sc_hd__inv_2 _280_ (.A(net194),
    .Y(_105_));
 sky130_fd_sc_hd__o21ai_1 _281_ (.A1(net204),
    .A2(net145),
    .B1(net330),
    .Y(_106_));
 sky130_fd_sc_hd__or3_1 _282_ (.A(_105_),
    .B(net330),
    .C(_100_),
    .X(_107_));
 sky130_fd_sc_hd__nor2_1 _283_ (.A(net8),
    .B(net147),
    .Y(_108_));
 sky130_fd_sc_hd__a31oi_2 _284_ (.A1(_107_),
    .A2(net147),
    .A3(_106_),
    .B1(_108_),
    .Y(\dpath.a_mux$out[0] ));
 sky130_fd_sc_hd__nand2b_1 _285_ (.A_N(net289),
    .B(net195),
    .Y(_109_));
 sky130_fd_sc_hd__mux2i_1 _288_ (.A0(net129),
    .A1(net182),
    .S(net126),
    .Y(_112_));
 sky130_fd_sc_hd__nand2_1 _289_ (.A(net19),
    .B(net143),
    .Y(_113_));
 sky130_fd_sc_hd__o21ai_1 _290_ (.A1(net143),
    .A2(_112_),
    .B1(_113_),
    .Y(\dpath.a_mux$out[10] ));
 sky130_fd_sc_hd__o21ai_1 _291_ (.A1(net126),
    .A2(net130),
    .B1(net181),
    .Y(_114_));
 sky130_fd_sc_hd__or3_1 _292_ (.A(net181),
    .B(net130),
    .C(_100_),
    .X(_115_));
 sky130_fd_sc_hd__nor2_1 _293_ (.A(net20),
    .B(net146),
    .Y(_116_));
 sky130_fd_sc_hd__a31oi_1 _294_ (.A1(net146),
    .A2(_115_),
    .A3(_114_),
    .B1(_116_),
    .Y(\dpath.a_mux$out[11] ));
 sky130_fd_sc_hd__mux2i_1 _295_ (.A0(net40),
    .A1(net180),
    .S(net202),
    .Y(_117_));
 sky130_fd_sc_hd__nor2_1 _296_ (.A(net21),
    .B(net146),
    .Y(_118_));
 sky130_fd_sc_hd__a21oi_1 _297_ (.A1(_117_),
    .A2(net146),
    .B1(_118_),
    .Y(\dpath.a_mux$out[12] ));
 sky130_fd_sc_hd__o21ai_1 _298_ (.A1(net128),
    .A2(net204),
    .B1(net178),
    .Y(_119_));
 sky130_fd_sc_hd__or3_1 _299_ (.A(net178),
    .B(net128),
    .C(net204),
    .X(_120_));
 sky130_fd_sc_hd__nor2_1 _300_ (.A(net22),
    .B(net146),
    .Y(_121_));
 sky130_fd_sc_hd__a31oi_1 _301_ (.A1(net146),
    .A2(_119_),
    .A3(_120_),
    .B1(_121_),
    .Y(\dpath.a_mux$out[13] ));
 sky130_fd_sc_hd__mux2i_1 _302_ (.A0(net127),
    .A1(net176),
    .S(net123),
    .Y(_122_));
 sky130_fd_sc_hd__nor2_1 _303_ (.A(net24),
    .B(net146),
    .Y(_123_));
 sky130_fd_sc_hd__a21oi_1 _304_ (.A1(net146),
    .A2(_122_),
    .B1(_123_),
    .Y(\dpath.a_mux$out[14] ));
 sky130_fd_sc_hd__o21ai_2 _305_ (.A1(net139),
    .A2(net339),
    .B1(net189),
    .Y(_124_));
 sky130_fd_sc_hd__xor2_1 _306_ (.A(_124_),
    .B(net175),
    .X(_125_));
 sky130_fd_sc_hd__nand2_1 _307_ (.A(net25),
    .B(net143),
    .Y(_126_));
 sky130_fd_sc_hd__o21ai_1 _308_ (.A1(_125_),
    .A2(net143),
    .B1(_126_),
    .Y(\dpath.a_mux$out[15] ));
 sky130_fd_sc_hd__mux2i_1 _309_ (.A0(net44),
    .A1(net368),
    .S(net125),
    .Y(_127_));
 sky130_fd_sc_hd__nand2_1 _310_ (.A(net9),
    .B(net144),
    .Y(_128_));
 sky130_fd_sc_hd__o21ai_1 _311_ (.A1(net144),
    .A2(_127_),
    .B1(_128_),
    .Y(\dpath.a_mux$out[1] ));
 sky130_fd_sc_hd__mux2i_4 _312_ (.A0(net45),
    .A1(net173),
    .S(net125),
    .Y(_129_));
 sky130_fd_sc_hd__nor2_1 _313_ (.A(net10),
    .B(net147),
    .Y(_130_));
 sky130_fd_sc_hd__a21oi_2 _314_ (.A1(_129_),
    .A2(net147),
    .B1(_130_),
    .Y(\dpath.a_mux$out[2] ));
 sky130_fd_sc_hd__mux2i_1 _315_ (.A0(net46),
    .A1(net172),
    .S(net125),
    .Y(_131_));
 sky130_fd_sc_hd__nand2_1 _316_ (.A(net11),
    .B(net144),
    .Y(_132_));
 sky130_fd_sc_hd__o21ai_1 _317_ (.A1(net144),
    .A2(_131_),
    .B1(_132_),
    .Y(\dpath.a_mux$out[3] ));
 sky130_fd_sc_hd__mux2i_1 _318_ (.A0(net47),
    .A1(net170),
    .S(net124),
    .Y(_133_));
 sky130_fd_sc_hd__nand2_1 _319_ (.A(net13),
    .B(net144),
    .Y(_134_));
 sky130_fd_sc_hd__o21ai_1 _320_ (.A1(net144),
    .A2(_133_),
    .B1(_134_),
    .Y(\dpath.a_mux$out[4] ));
 sky130_fd_sc_hd__mux2i_1 _321_ (.A0(net133),
    .A1(net169),
    .S(net124),
    .Y(_135_));
 sky130_fd_sc_hd__nand2_1 _322_ (.A(net14),
    .B(net144),
    .Y(_136_));
 sky130_fd_sc_hd__o21ai_1 _323_ (.A1(_135_),
    .A2(net144),
    .B1(_136_),
    .Y(\dpath.a_mux$out[5] ));
 sky130_fd_sc_hd__mux2i_1 _324_ (.A0(net215),
    .A1(net168),
    .S(net124),
    .Y(_137_));
 sky130_fd_sc_hd__nand2_1 _325_ (.A(net15),
    .B(net144),
    .Y(_138_));
 sky130_fd_sc_hd__o21ai_1 _326_ (.A1(net144),
    .A2(_137_),
    .B1(_138_),
    .Y(\dpath.a_mux$out[6] ));
 sky130_fd_sc_hd__mux2i_1 _327_ (.A0(net248),
    .A1(net167),
    .S(net124),
    .Y(_139_));
 sky130_fd_sc_hd__nor2_1 _328_ (.A(net16),
    .B(net147),
    .Y(_140_));
 sky130_fd_sc_hd__a21oi_1 _329_ (.A1(_139_),
    .A2(net147),
    .B1(_140_),
    .Y(\dpath.a_mux$out[7] ));
 sky130_fd_sc_hd__mux2i_1 _330_ (.A0(net51),
    .A1(net166),
    .S(net203),
    .Y(_141_));
 sky130_fd_sc_hd__nand2_1 _331_ (.A(net17),
    .B(net143),
    .Y(_142_));
 sky130_fd_sc_hd__o21ai_1 _332_ (.A1(net143),
    .A2(_141_),
    .B1(_142_),
    .Y(\dpath.a_mux$out[8] ));
 sky130_fd_sc_hd__mux2i_1 _333_ (.A0(net131),
    .A1(net164),
    .S(net126),
    .Y(_143_));
 sky130_fd_sc_hd__nand2_1 _334_ (.A(net18),
    .B(net143),
    .Y(_144_));
 sky130_fd_sc_hd__o21ai_1 _335_ (.A1(net143),
    .A2(_143_),
    .B1(_144_),
    .Y(\dpath.a_mux$out[9] ));
 sky130_fd_sc_hd__nand2_1 _337_ (.A(net288),
    .B(net1),
    .Y(_146_));
 sky130_fd_sc_hd__o21ai_2 _338_ (.A1(net288),
    .A2(net145),
    .B1(_146_),
    .Y(\dpath.b_mux$out[0] ));
 sky130_fd_sc_hd__nand2_1 _339_ (.A(net288),
    .B(net2),
    .Y(_147_));
 sky130_fd_sc_hd__o21ai_0 _340_ (.A1(net288),
    .A2(net149),
    .B1(_147_),
    .Y(\dpath.b_mux$out[10] ));
 sky130_fd_sc_hd__mux2_4 _341_ (.A0(net193),
    .A1(net3),
    .S(net289),
    .X(\dpath.b_mux$out[11] ));
 sky130_fd_sc_hd__nand2_1 _342_ (.A(net196),
    .B(net4),
    .Y(_148_));
 sky130_fd_sc_hd__o21ai_0 _343_ (.A1(net196),
    .A2(net148),
    .B1(_148_),
    .Y(\dpath.b_mux$out[12] ));
 sky130_fd_sc_hd__nand2_1 _344_ (.A(net196),
    .B(net5),
    .Y(_149_));
 sky130_fd_sc_hd__o21ai_0 _345_ (.A1(net196),
    .A2(_078_),
    .B1(_149_),
    .Y(\dpath.b_mux$out[13] ));
 sky130_fd_sc_hd__nand2_1 _346_ (.A(net196),
    .B(net6),
    .Y(_150_));
 sky130_fd_sc_hd__o21ai_0 _347_ (.A1(net196),
    .A2(_096_),
    .B1(_150_),
    .Y(\dpath.b_mux$out[14] ));
 sky130_fd_sc_hd__mux2_4 _348_ (.A0(net189),
    .A1(net7),
    .S(net289),
    .X(\dpath.b_mux$out[15] ));
 sky130_fd_sc_hd__nand2_1 _349_ (.A(net288),
    .B(net12),
    .Y(_151_));
 sky130_fd_sc_hd__o21ai_0 _350_ (.A1(net289),
    .A2(_017_),
    .B1(_151_),
    .Y(\dpath.b_mux$out[1] ));
 sky130_fd_sc_hd__nand2_1 _351_ (.A(net288),
    .B(net23),
    .Y(_152_));
 sky130_fd_sc_hd__o21ai_0 _352_ (.A1(net289),
    .A2(_023_),
    .B1(_152_),
    .Y(\dpath.b_mux$out[2] ));
 sky130_fd_sc_hd__mux2_4 _353_ (.A0(\dpath.a_lt_b$in0[3] ),
    .A1(net26),
    .S(net289),
    .X(\dpath.b_mux$out[3] ));
 sky130_fd_sc_hd__nand2_1 _354_ (.A(net288),
    .B(net27),
    .Y(_153_));
 sky130_fd_sc_hd__o21ai_0 _355_ (.A1(net288),
    .A2(net157),
    .B1(_153_),
    .Y(\dpath.b_mux$out[4] ));
 sky130_fd_sc_hd__mux2_4 _356_ (.A0(\dpath.a_lt_b$in0[5] ),
    .A1(net28),
    .S(net289),
    .X(\dpath.b_mux$out[5] ));
 sky130_fd_sc_hd__mux2_4 _357_ (.A0(net185),
    .A1(net29),
    .S(net289),
    .X(\dpath.b_mux$out[6] ));
 sky130_fd_sc_hd__nand2_2 _358_ (.A(net196),
    .B(net30),
    .Y(_154_));
 sky130_fd_sc_hd__o21ai_0 _359_ (.A1(net196),
    .A2(_081_),
    .B1(_154_),
    .Y(\dpath.b_mux$out[7] ));
 sky130_fd_sc_hd__mux2_4 _360_ (.A0(\dpath.a_lt_b$in0[8] ),
    .A1(net31),
    .S(net289),
    .X(\dpath.b_mux$out[8] ));
 sky130_fd_sc_hd__nand2_1 _361_ (.A(net288),
    .B(net32),
    .Y(_155_));
 sky130_fd_sc_hd__o21ai_0 _362_ (.A1(net288),
    .A2(net150),
    .B1(_155_),
    .Y(\dpath.b_mux$out[9] ));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkload0 (.A(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_1 clkload1 (.A(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkload2 (.A(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__o31ai_4 clone204 (.A1(_097_),
    .A2(net331),
    .A3(_093_),
    .B1(_094_),
    .Y(net204));
 sky130_fd_sc_hd__a21o_4 clone214 (.A1(net204),
    .A2(net195),
    .B1(net289),
    .X(net214));
 sky130_fd_sc_hd__bufbuf_16 clone288 (.A(net36),
    .X(net288));
 sky130_fd_sc_hd__dfxtp_2 \ctrl.state.out[0]$_DFF_P_  (.D(_000_),
    .Q(net36),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__dfxtp_1 \ctrl.state.out[1]$_DFF_P_  (.D(_001_),
    .Q(\ctrl.state.out[1] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__dfxtp_2 \ctrl.state.out[2]$_DFF_P_  (.D(_002_),
    .Q(\ctrl.state.out[2] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[0]$_DFFE_PP_  (.D(\dpath.a_mux$out[0] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[0] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[10]$_DFFE_PP_  (.D(\dpath.a_mux$out[10] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[10] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[11]$_DFFE_PP_  (.D(\dpath.a_mux$out[11] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[11] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[12]$_DFFE_PP_  (.D(\dpath.a_mux$out[12] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[12] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[13]$_DFFE_PP_  (.D(\dpath.a_mux$out[13] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[13] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[14]$_DFFE_PP_  (.D(\dpath.a_mux$out[14] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[14] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[15]$_DFFE_PP_  (.D(\dpath.a_mux$out[15] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[15] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[1]$_DFFE_PP_  (.D(\dpath.a_mux$out[1] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[1] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[2]$_DFFE_PP_  (.D(\dpath.a_mux$out[2] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[2] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[3]$_DFFE_PP_  (.D(\dpath.a_mux$out[3] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[3] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[4]$_DFFE_PP_  (.D(\dpath.a_mux$out[4] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[4] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[5]$_DFFE_PP_  (.D(\dpath.a_mux$out[5] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[5] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[6]$_DFFE_PP_  (.D(\dpath.a_mux$out[6] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[6] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[7]$_DFFE_PP_  (.D(\dpath.a_mux$out[7] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[7] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[8]$_DFFE_PP_  (.D(\dpath.a_mux$out[8] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[8] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.a_reg.out[9]$_DFFE_PP_  (.D(\dpath.a_mux$out[9] ),
    .DE(net160),
    .Q(\dpath.a_lt_b$in0[9] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[0]$_DFFE_PP_  (.D(\dpath.b_mux$out[0] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[0] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[10]$_DFFE_PP_  (.D(\dpath.b_mux$out[10] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[10] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[11]$_DFFE_PP_  (.D(\dpath.b_mux$out[11] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[11] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[12]$_DFFE_PP_  (.D(\dpath.b_mux$out[12] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[12] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[13]$_DFFE_PP_  (.D(\dpath.b_mux$out[13] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[13] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[14]$_DFFE_PP_  (.D(\dpath.b_mux$out[14] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[14] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[15]$_DFFE_PP_  (.D(\dpath.b_mux$out[15] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[15] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[1]$_DFFE_PP_  (.D(\dpath.b_mux$out[1] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[1] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[2]$_DFFE_PP_  (.D(\dpath.b_mux$out[2] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[2] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[3]$_DFFE_PP_  (.D(\dpath.b_mux$out[3] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[3] ),
    .CLK(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[4]$_DFFE_PP_  (.D(\dpath.b_mux$out[4] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[4] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[5]$_DFFE_PP_  (.D(\dpath.b_mux$out[5] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[5] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[6]$_DFFE_PP_  (.D(\dpath.b_mux$out[6] ),
    .DE(\ctrl$b_reg_en[0] ),
    .Q(\dpath.a_lt_b$in1[6] ),
    .CLK(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[7]$_DFFE_PP_  (.D(\dpath.b_mux$out[7] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[7] ),
    .CLK(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[8]$_DFFE_PP_  (.D(\dpath.b_mux$out[8] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[8] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__edfxtp_1 \dpath.b_reg.out[9]$_DFFE_PP_  (.D(\dpath.b_mux$out[9] ),
    .DE(net214),
    .Q(\dpath.a_lt_b$in1[9] ),
    .CLK(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input1 (.A(req_msg[0]),
    .X(net1));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input10 (.A(req_msg[18]),
    .X(net10));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input11 (.A(req_msg[19]),
    .X(net11));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input12 (.A(req_msg[1]),
    .X(net12));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input13 (.A(req_msg[20]),
    .X(net13));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input14 (.A(req_msg[21]),
    .X(net14));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input15 (.A(req_msg[22]),
    .X(net15));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input16 (.A(req_msg[23]),
    .X(net16));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input17 (.A(req_msg[24]),
    .X(net17));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input18 (.A(req_msg[25]),
    .X(net18));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input19 (.A(req_msg[26]),
    .X(net19));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input2 (.A(req_msg[10]),
    .X(net2));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input20 (.A(req_msg[27]),
    .X(net20));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input21 (.A(req_msg[28]),
    .X(net21));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input22 (.A(req_msg[29]),
    .X(net22));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input23 (.A(req_msg[2]),
    .X(net23));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input24 (.A(req_msg[30]),
    .X(net24));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input25 (.A(req_msg[31]),
    .X(net25));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input26 (.A(req_msg[3]),
    .X(net26));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input27 (.A(req_msg[4]),
    .X(net27));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input28 (.A(req_msg[5]),
    .X(net28));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input29 (.A(req_msg[6]),
    .X(net29));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input3 (.A(req_msg[11]),
    .X(net3));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input30 (.A(req_msg[7]),
    .X(net30));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input31 (.A(req_msg[8]),
    .X(net31));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input32 (.A(req_msg[9]),
    .X(net32));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input33 (.A(req_val),
    .X(net33));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input34 (.A(reset),
    .X(net34));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input35 (.A(resp_rdy),
    .X(net35));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input4 (.A(req_msg[12]),
    .X(net4));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input5 (.A(req_msg[13]),
    .X(net5));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input6 (.A(req_msg[14]),
    .X(net6));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input7 (.A(req_msg[15]),
    .X(net7));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input8 (.A(req_msg[16]),
    .X(net8));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input9 (.A(req_msg[17]),
    .X(net9));
 sky130_fd_sc_hd__buf_6 output36 (.A(net290),
    .X(req_rdy));
 sky130_fd_sc_hd__clkdlybuf4s15_1 output37 (.A(net37),
    .X(resp_msg[0]));
 sky130_fd_sc_hd__buf_2 output38 (.A(net38),
    .X(resp_msg[10]));
 sky130_fd_sc_hd__buf_2 output39 (.A(net39),
    .X(resp_msg[11]));
 sky130_fd_sc_hd__buf_2 output40 (.A(net40),
    .X(resp_msg[12]));
 sky130_fd_sc_hd__buf_2 output41 (.A(net41),
    .X(resp_msg[13]));
 sky130_fd_sc_hd__buf_2 output42 (.A(net42),
    .X(resp_msg[14]));
 sky130_fd_sc_hd__buf_2 output43 (.A(net43),
    .X(resp_msg[15]));
 sky130_fd_sc_hd__buf_2 output44 (.A(net44),
    .X(resp_msg[1]));
 sky130_fd_sc_hd__dlygate4sd2_1 output45 (.A(net45),
    .X(resp_msg[2]));
 sky130_fd_sc_hd__dlygate4sd2_1 output46 (.A(net46),
    .X(resp_msg[3]));
 sky130_fd_sc_hd__dlymetal6s2s_1 output47 (.A(net47),
    .X(resp_msg[4]));
 sky130_fd_sc_hd__dlygate4sd2_1 output48 (.A(net48),
    .X(resp_msg[5]));
 sky130_fd_sc_hd__clkbuf_2 output49 (.A(net49),
    .X(resp_msg[6]));
 sky130_fd_sc_hd__buf_2 output50 (.A(net50),
    .X(resp_msg[7]));
 sky130_fd_sc_hd__buf_2 output51 (.A(net51),
    .X(resp_msg[8]));
 sky130_fd_sc_hd__buf_2 output52 (.A(net52),
    .X(resp_msg[9]));
 sky130_fd_sc_hd__buf_2 output53 (.A(net53),
    .X(resp_val));
 sky130_fd_sc_hd__buf_4 place123 (.A(net204),
    .X(net123));
 sky130_fd_sc_hd__buf_6 place124 (.A(_100_),
    .X(net124));
 sky130_fd_sc_hd__buf_12 place125 (.A(_100_),
    .X(net125));
 sky130_fd_sc_hd__buf_4 place126 (.A(_100_),
    .X(net126));
 sky130_fd_sc_hd__buf_4 place127 (.A(net207),
    .X(net127));
 sky130_fd_sc_hd__buf_4 place128 (.A(_077_),
    .X(net128));
 sky130_fd_sc_hd__buf_4 place129 (.A(net38),
    .X(net129));
 sky130_fd_sc_hd__buf_4 place130 (.A(_064_),
    .X(net130));
 sky130_fd_sc_hd__buf_4 place131 (.A(net52),
    .X(net131));
 sky130_fd_sc_hd__buf_6 place132 (.A(_073_),
    .X(net132));
 sky130_fd_sc_hd__buf_4 place133 (.A(net48),
    .X(net133));
 sky130_fd_sc_hd__buf_6 place134 (.A(_046_),
    .X(net134));
 sky130_fd_sc_hd__buf_4 place135 (.A(net344),
    .X(net135));
 sky130_fd_sc_hd__buf_6 place137 (.A(net216),
    .X(net137));
 sky130_fd_sc_hd__buf_4 place138 (.A(_072_),
    .X(net138));
 sky130_fd_sc_hd__buf_4 place139 (.A(_097_),
    .X(net139));
 sky130_fd_sc_hd__buf_4 place140 (.A(_054_),
    .X(net140));
 sky130_fd_sc_hd__buf_4 place141 (.A(_037_),
    .X(net141));
 sky130_fd_sc_hd__buf_4 place142 (.A(_018_),
    .X(net142));
 sky130_fd_sc_hd__buf_4 place143 (.A(_109_),
    .X(net143));
 sky130_fd_sc_hd__buf_4 place144 (.A(_109_),
    .X(net144));
 sky130_fd_sc_hd__buf_6 place145 (.A(_105_),
    .X(net145));
 sky130_fd_sc_hd__buf_4 place146 (.A(_103_),
    .X(net146));
 sky130_fd_sc_hd__buf_4 place147 (.A(_103_),
    .X(net147));
 sky130_fd_sc_hd__buf_4 place148 (.A(_075_),
    .X(net148));
 sky130_fd_sc_hd__buf_4 place149 (.A(_070_),
    .X(net149));
 sky130_fd_sc_hd__buf_4 place150 (.A(_060_),
    .X(net150));
 sky130_fd_sc_hd__buf_4 place151 (.A(_058_),
    .X(net151));
 sky130_fd_sc_hd__buf_4 place152 (.A(_053_),
    .X(net152));
 sky130_fd_sc_hd__buf_4 place153 (.A(_052_),
    .X(net153));
 sky130_fd_sc_hd__buf_4 place154 (.A(_050_),
    .X(net154));
 sky130_fd_sc_hd__buf_4 place155 (.A(_048_),
    .X(net155));
 sky130_fd_sc_hd__buf_4 place156 (.A(_047_),
    .X(net156));
 sky130_fd_sc_hd__buf_4 place157 (.A(_036_),
    .X(net157));
 sky130_fd_sc_hd__buf_4 place158 (.A(_035_),
    .X(net158));
 sky130_fd_sc_hd__buf_6 place160 (.A(\ctrl$a_reg_en[0] ),
    .X(net160));
 sky130_fd_sc_hd__buf_4 place161 (.A(_010_),
    .X(net161));
 sky130_fd_sc_hd__buf_4 place164 (.A(\dpath.a_lt_b$in1[9] ),
    .X(net164));
 sky130_fd_sc_hd__buf_4 place165 (.A(\dpath.a_lt_b$in1[9] ),
    .X(net165));
 sky130_fd_sc_hd__buf_4 place166 (.A(\dpath.a_lt_b$in1[8] ),
    .X(net166));
 sky130_fd_sc_hd__buf_4 place167 (.A(net366),
    .X(net167));
 sky130_fd_sc_hd__buf_4 place168 (.A(\dpath.a_lt_b$in1[6] ),
    .X(net168));
 sky130_fd_sc_hd__buf_4 place169 (.A(\dpath.a_lt_b$in1[5] ),
    .X(net169));
 sky130_fd_sc_hd__buf_4 place170 (.A(net171),
    .X(net170));
 sky130_fd_sc_hd__buf_4 place171 (.A(\dpath.a_lt_b$in1[4] ),
    .X(net171));
 sky130_fd_sc_hd__buf_4 place172 (.A(\dpath.a_lt_b$in1[3] ),
    .X(net172));
 sky130_fd_sc_hd__buf_4 place173 (.A(\dpath.a_lt_b$in1[2] ),
    .X(net173));
 sky130_fd_sc_hd__buf_4 place175 (.A(\dpath.a_lt_b$in1[15] ),
    .X(net175));
 sky130_fd_sc_hd__buf_4 place176 (.A(\dpath.a_lt_b$in1[14] ),
    .X(net176));
 sky130_fd_sc_hd__buf_4 place178 (.A(\dpath.a_lt_b$in1[13] ),
    .X(net178));
 sky130_fd_sc_hd__buf_4 place179 (.A(\dpath.a_lt_b$in1[13] ),
    .X(net179));
 sky130_fd_sc_hd__buf_4 place180 (.A(\dpath.a_lt_b$in1[12] ),
    .X(net180));
 sky130_fd_sc_hd__buf_4 place181 (.A(\dpath.a_lt_b$in1[11] ),
    .X(net181));
 sky130_fd_sc_hd__buf_4 place182 (.A(\dpath.a_lt_b$in1[10] ),
    .X(net182));
 sky130_fd_sc_hd__buf_4 place184 (.A(\dpath.a_lt_b$in0[7] ),
    .X(net184));
 sky130_fd_sc_hd__buf_4 place185 (.A(\dpath.a_lt_b$in0[6] ),
    .X(net185));
 sky130_fd_sc_hd__buf_4 place186 (.A(\dpath.a_lt_b$in0[4] ),
    .X(net186));
 sky130_fd_sc_hd__buf_4 place187 (.A(\dpath.a_lt_b$in0[2] ),
    .X(net187));
 sky130_fd_sc_hd__buf_6 place188 (.A(\dpath.a_lt_b$in0[1] ),
    .X(net188));
 sky130_fd_sc_hd__buf_4 place189 (.A(\dpath.a_lt_b$in0[15] ),
    .X(net189));
 sky130_fd_sc_hd__buf_4 place190 (.A(\dpath.a_lt_b$in0[14] ),
    .X(net190));
 sky130_fd_sc_hd__buf_4 place191 (.A(\dpath.a_lt_b$in0[13] ),
    .X(net191));
 sky130_fd_sc_hd__buf_4 place192 (.A(\dpath.a_lt_b$in0[12] ),
    .X(net192));
 sky130_fd_sc_hd__buf_4 place193 (.A(\dpath.a_lt_b$in0[11] ),
    .X(net193));
 sky130_fd_sc_hd__buf_6 place194 (.A(net287),
    .X(net194));
 sky130_fd_sc_hd__buf_4 place195 (.A(\ctrl.state.out[2] ),
    .X(net195));
 sky130_fd_sc_hd__buf_8 place196 (.A(net289),
    .X(net196));
 sky130_fd_sc_hd__buf_12 place197 (.A(net36),
    .X(net197));
 sky130_fd_sc_hd__buf_4 place198 (.A(net34),
    .X(net198));
 sky130_fd_sc_hd__buf_4 place199 (.A(net33),
    .X(net199));
 sky130_fd_sc_hd__buf_4 rebuffer200 (.A(_024_),
    .X(net200));
 sky130_fd_sc_hd__buf_6 rebuffer201 (.A(_042_),
    .X(net201));
 sky130_fd_sc_hd__buf_4 rebuffer202 (.A(_100_),
    .X(net202));
 sky130_fd_sc_hd__buf_4 rebuffer203 (.A(net204),
    .X(net203));
 sky130_fd_sc_hd__buf_4 rebuffer206 (.A(_098_),
    .X(net206));
 sky130_fd_sc_hd__buf_4 rebuffer207 (.A(net42),
    .X(net207));
 sky130_fd_sc_hd__buf_6 rebuffer212 (.A(net134),
    .X(net212));
 sky130_fd_sc_hd__buf_4 rebuffer215 (.A(net49),
    .X(net215));
 sky130_fd_sc_hd__buf_6 rebuffer216 (.A(net345),
    .X(net216));
 sky130_fd_sc_hd__buf_4 rebuffer245 (.A(_032_),
    .X(net245));
 sky130_fd_sc_hd__buf_4 rebuffer248 (.A(net50),
    .X(net248));
 sky130_fd_sc_hd__buf_4 rebuffer287 (.A(\dpath.a_lt_b$in0[0] ),
    .X(net287));
 sky130_fd_sc_hd__buf_12 rebuffer289 (.A(net197),
    .X(net289));
 sky130_fd_sc_hd__buf_6 rebuffer290 (.A(net197),
    .X(net290));
 sky130_fd_sc_hd__buf_6 rebuffer292 (.A(\dpath.a_lt_b$in1[14] ),
    .X(net292));
 sky130_fd_sc_hd__buf_4 rebuffer330 (.A(\dpath.a_lt_b$in1[0] ),
    .X(net330));
 sky130_fd_sc_hd__buf_4 rebuffer331 (.A(_098_),
    .X(net331));
 sky130_fd_sc_hd__buf_4 rebuffer332 (.A(_082_),
    .X(net332));
 sky130_fd_sc_hd__buf_4 rebuffer337 (.A(_015_),
    .X(net337));
 sky130_fd_sc_hd__buf_4 rebuffer338 (.A(_088_),
    .X(net338));
 sky130_fd_sc_hd__buf_4 rebuffer339 (.A(net206),
    .X(net339));
 sky130_fd_sc_hd__buf_6 rebuffer341 (.A(net134),
    .X(net341));
 sky130_fd_sc_hd__buf_6 rebuffer342 (.A(net201),
    .X(net342));
 sky130_fd_sc_hd__buf_4 rebuffer344 (.A(_032_),
    .X(net344));
 sky130_fd_sc_hd__buf_4 rebuffer345 (.A(_025_),
    .X(net345));
 sky130_fd_sc_hd__buf_4 rebuffer366 (.A(\dpath.a_lt_b$in1[7] ),
    .X(net366));
 sky130_fd_sc_hd__buf_4 rebuffer368 (.A(\dpath.a_lt_b$in1[1] ),
    .X(net368));
endmodule
