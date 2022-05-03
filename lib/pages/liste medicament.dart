
import 'package:flutter/material.dart';


class MedicamentSearch extends SearchDelegate<String> {
  final medicaments = [
   // Classe : APPAREIL DIGESTIF ET METABOLISME    Sous Classe : MEDICAMENT UTILISE DANS LE TRAITEMENT DU DIABETE
    "ACARBOSE ADWYA 	100 mg",


  "ACARBOSE ADWYA 	50 mg" ,


  "ACARLYSE 	100 mg" 	,
  "ACARLYSE 	50 mg" 	,
  "ACTRAPID 	100 UI/ML" ,

  "ACTRAPID PENFILL 	100 UI/ML" ,


  "ALPHA-GLUCOFF 	50 mg" ,


  "ALPHA-GLUCOFF 	100 mg" 	,


  "AMAREL 	6 mg" 	,

  "AMAREL 	2 mg" ,


  "AMAREL 	3 mg" 	,

  "AMAREL 	1 mg" 	,




  "AMAREL 	4 mg" 	,

  "AMARYL M 	2 mg/500 mg" 	,


  "APIDRA SOLOSTAR 	100 UI/ML" 	,




  "BROT 	850 MG" 	,
  "CARBOLESS 100" 	,
  "CARBOLESS 50" 	,
  "DAONIL 	5 mg"	,




  "DAONIL 	5 MG" 	,



  "DAONIL 	5 mg" ,
  "DAONIL 	5 MG" 	,
  "DIABENORM 	30 mg" ,
  "DIABENORM 	80 mg" 	,

  "DIABENORM 	80 mg" 	,


  "DIABENYL 	5 MG" 	,
  "DIABENYL 	5 MG" ,
  "DIABENYL 	5 MG" 	,
  "DIABICOR 	100 MG" ,
  "DIABICOR 	50 MG" 	,
  "DIABIPHAGE 	850 mg" 	,
 " DIABIPHAGE 	1000 mg" ,
  "DIABIREL 	3 mg" 	,
 " DIABIREL 	4 mg" 	,
 " DIABIREL 	2 mg" 	,
  "DIABIREL 	1 mg 	",
  "DIABITOS 	850 mg "	,




  "DIABITOS 	850 mg" 	,



  "DIABITOS 	1000 mg" 	,




  "DIABITOS 850 	850 mg" ,




 " DIABITOS 850 	850 mg" 	,




  "DIAFORMINE 	500 mg ",



 " DIAFORMINE 	1000 mg" 	,



  "DIAFORMINE 850 	850 MG "	,


  "DIAFORMINE 850 	850 MG "	,
  "DIALON 	850 mg "	,
 " DIAMEZID 	30 mg" 	,
  "DIAMEZID 	30 mg" 	,
  "DIAMEZID 	60 mg "	,
 " DIAMEZID 	60 mg "	,
 " DIAMICRON 	60 mg "	,
  "DIAMICRON 	60 mg" 	,




  "DIAMICRON 	60 mg" 	,




"DIAMICRON LM 	30 mg "	,
 "DIVINUS 	5 mg" 	,




  "DIVINUS 	10 mg" ,



  "FORMIDIAB 	850 MG" 	,


  "FORMIDIAB 	850 MG "	,

  "FORXIGA 	10 mg" 	,



  "FORXIGA 	5 mg" 	,



  "GALVINE 	50 mg" 	,
  "GALVUMET 	50 mg/1000 mg" 	,




  "GALVUMET 	50 mg/500 mg" 	,



  "GALVUMET 	50 mg/850 mg" 	,




  "GALVUS 	50 mg" 	,




  "GENSULIN M30 (30/70)" 	,


  "GENSULIN N 	100 UI/ML" 	,




  "GENSULIN R 	100 UI/ML" 	,




  "GLARGEN 	100 UI/ml" 	,
  "GLARGEN 	100 UI/ml" ,
  "GLIBENCLAMIDE 	5 MG" 	,
 " GLIBENCLAMIDE 	5 mg" 	,
  "GLIBENCLAMIDE 	5 MG" ,


  "GLIBENCLAMIDE 2.5 	2.5 MG" 	,
  "GLIMEPIRIDE WINTHROP 	1 MG "	,


  "GLIMEPIRIDE WINTHROP 	4 mg "	,


  "GLIMEPIRIDE WINTHROP 	2 mg" 	,

  "GLIMEPIRIDE WINTHROP 	3 mg" 	,

  "GLIMEREL 	4 mg" 	,
  "GLIMEREL 	2 mg" 	,
  "GLIMEREL 	2 mg" 	,
  "GLIMID 	3 mg" 	,
  "GLIMID 	2 mg "	,


 " GLIMID 	1 mg" 	,


  "GLIMID 	4 mg" 	,


  "GLIMID 	3 mg" 	,
  "GLIMID 	1 mg" 	,


  "GLIMID 	2 mg" 	,


  "GLIMID 	4 mg "	,


 " GLIMID 	6 mg" 	,


  "GLIMID 	6 mg" 	,


  "GLINORM 	1 mg" 	,



  "GLINORM 	2 mg" 	,



  "GLINORM 	1 mg" 	,
  "GLINORM 	2 mg" 	,
  "GLIPTAMET 	50 mg/850 mg" 	,
  "GLIPTAVIL 	50 mg" ,
 " GLITEX 	2 mg/500 mg" 	,
  "GLITIVIA 	100 mg" 	,
  "GLITRA 	1 mg "	,
  "GLITRA 	1 mg" 	,
  "GLITRA 	4 mg "	,
  "GLITRA 	2 MG" 	,
  "GLITRA 	3 mg "	,
  "GLITRA 	2 MG" 	,
  "GLITRA 	3 mg" 	,
  "GLITRA 	4 mg" 	,
  "GLUCOPHAGE 	850 mg ",


  "GLUCOPHAGE 	850 MG" 	,
  "GLUCOPHAGE 	1000 mg" 	,


  "GLUCOPHAGE 	1000 mg" 	,


 " GLUCOPLUS 	850 mg "	,
 " GLUCOPLUS 	500 mg ",
  "GLUCOPLUS 	1000 mg" 	,
 " GLUCOR 	50 MG" ,
  "GLUCOR 	100 MG" 	,
  "GLUCOVANCE 	500mg/5mg" ,




  "GLUCOVANCE 	1000mg/5mg" 	,




 " GLUFIX 	100 mg" 	,
  "GLUFIX 	50 mg" 	,
  "GLURENOR 	30 MG" ,


 " GLYCARBOSE 	50 MG" 	,
  "GLYCARBOSE 	100 MG" 	,
  "INSULATARD 100 UI/ML 	100 UI/ML" ,

  "INSULATARD PENFILL 100 UI/ML 	100 UI/ML "	,


  "IRYS 	1 mg" 	,
  "IRYS 	2 mg" 	,
 " IRYS 	3 mg ",
  "IRYS 	4 mg "	,
  // IRYS 	1 mg 	Comprimé pelliculé sécable 	B/90 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	9233359 	2010-03-27 	Générique
  // IRYS 	3 mg 	Comprimé pelliculé sécable 	B/90 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	92333511 	2010-03-27 	Générique
  // IRYS 	4 mg 	Comprimé pelliculé sécable 	B/90 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	92333512 	2010-03-27 	Générique
  // IRYS 	2 mg 	Comprimé pelliculé sécable 	B/90 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	92333510 	2010-03-27 	Générique
  // IRYS 	6 mg 	Comprimé pelliculé sécable 	B/30 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	92333513 	2018-05-14 	Générique
  //
  //
  //
  //
  // IRYS 	6 mg 	Comprimé pelliculé sécable 	B/90 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	92333514 	2018-05-14 	Générique
  //
  //
  //
  //
  // IRYS 	1 mg 	Comprimé pelliculé sécable 	B/30 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	9233351 	2006-06-01 	Générique
  // IRYS 	2 mg 	Comprimé pelliculé sécable 	B/30 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	9233352 	2006-06-01 	Générique
  // IRYS 	3 mg 	Comprimé pelliculé sécable 	B/30 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	9233353 	2006-06-01 	Générique
  // IRYS 	4 mg 	Comprimé pelliculé sécable 	B/30 	GLIMEPIRIDE 	LES LABORATOIRES MEDIS 	Tunisie 	9233354 	2006-06-01 	Générique
  // JANUMET 	50 mg/1000mg 	Comprimé pelliculé 	B/56 	SITAGLIPTINE+METFORMINE 	MERCK SHARP & DOHME BV 	HOLLANDE 	70133141 	2021-11-03 	Princeps
  //
  //
  // JANUMET 	50 mg/850mg 	Comprimé pelliculé 	B/56 	SITAGLIPTINE+METFORMINE 	Merck Sharp & Dohme Ltd R.U 	United Kingdom 	3443092 	2016-02-04 	Princeps
  //
  //
  //
  //
  // JANUVIA 	100 mg 	Comprimé pelliculé 	B/28 	SITAGLIPTINE 	Merck Sharp & Dohme Ltd R.U 	United Kingdom 	3443071 	2011-12-28 	Princeps
  //
  //
  //
  //
  // JARDIANCE 	25 mg 	Comprimé pelliculé 	B/30 	EMPAGLIFLOZINE 	BOEHRINGER ING.INT.GmbH 	Germany 	11533071 	2018-05-04 	Princeps
  //
  //
  //
  //
  // JARDIANCE 	10 mg 	Comprimé pelliculé 	B/30 	EMPAGLIFLOZINE 	BOEHRINGER ING.INT.GmbH 	Germany 	11533072 	2018-05-04 	Princeps
  //
  //
  //
  //
  // JENTADUETO 	2.5 mg/ 850 mg 	Comprimé pelliculé 	B/56 	LINAGLIPTINE + CHLORHYDRATE DE METFORMINE 	BOEHRINGER ING.INT.GmbH 	Germany 	11533062 	2017-02-20 	Princeps
  //
  //
  //
  //
  // JENTADUETO 	2.5 mg/ 1000 mg 	Comprimé pelliculé 	B/56 	LINAGLIPTINE + CHLORHYDRATE DE METFORMINE 	BOEHRINGER ING.INT.GmbH 	Germany 	11533063 	2017-02-22 	Princeps
  //
  //
  //
  //
  // JUSLINE 30/70 	100 UI/ML 	Suspension injectable 	B/1/10 ML 	INSULINE HUMAINE 	JULPHAR 	United Arab Emirates 	7473193 	2012-08-21 	Générique
  //
  //
  // JUSLINE N 	100 UI/ML 	Suspension injectable 	B/1/10 ML 	INSULINE HUMAINE 	JULPHAR 	United Arab Emirates 	7473191 	2012-08-22 	Générique
  //
  //
  // JUSLINE R 	100 UI/ML 	Solution injectable 	B/1/10 ML 	INSULINE HUMAINE 	JULPHAR 	United Arab Emirates 	7473192 	2012-08-21 	Générique
  //
  //
  // KOMBIGLYZE XR 	5 mg/1000 mg 	Comprimé 	B/30 	SAXAGLIPTIN+METFORMINE 	AstraZeneca AB SUEDE 	SUEDE 	8233022 	2015-12-01 	Princeps
  // LANTUS 	100 UI/ML 	Solution injectable 	B/5 Cartouches/3ML 	INSULINE ANALOGUE 	SANOFI-AVENTIS Deutschland GmbH 	Germany 	1823021 	2003-04-24 	Princeps
  // LANTUS SOLOSTAR 	100 UI/ML 	Solution injectable 	B/5 stylos préremplis/3 ml 	INSULINE ANALOGUE 	SANOFI-AVENTIS Deutschland GmbH 	Germany 	1823025 	2008-05-28 	Princeps
  //
  //
  // LEVEMIR FLEXPEN 	100 UI/ML 	Solution injectable 	B//5 stylos injecteurs/3 ML 	INSULINE ANALOGUE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993071 	2006-10-30 	Princeps
  //
  //
  // MEFOR 	850 mg 	Comprimé pelliculé 	B/60 	METFORMINE 	TERIAK 	Tunisie 	9253921 	2016-11-11 	Générique
  // MEFOR 	1 gr 	Comprimé pelliculé sécable 	B/60 	METFORMINE 	TERIAK 	Tunisie 	9253922 	2016-11-11 	Générique
  // METFORAL 	850 MG 	Comprime enrobé 	B/30 	METFORMINE 	SAIPH 	Tunisie 	9163141 	1997-12-24 	Générique
  //
  //
  // METFORAL 	850 mg 	Comprime enrobé 	B/105 	METFORMINE 	SAIPH 	Tunisie 	9163144 	2007-09-03 	Générique
  //
  //
  // METFORMINE MYLAN PHARMA 	850 MG 	Comprimé pelliculé 	B/90 	METFORMINE 	MYLAN S.A.S 	FRANCE 	4923302 	2018-03-02 	Générique
  // METFORMINE MYLAN PHARMA 	850 MG 	Comprimé pelliculé 	B/30 	METFORMINE 	MYLAN S.A.S 	FRANCE 	4923301 	2018-03-02 	Générique
  // METFORMINE OPALIA 	850 mg 	Comprimé pelliculé 	B/60 	METFORMINE 	OPALIA PHARMA 	Tunisie 	ST9024131 	2017-04-21 	Générique
  // METFORMINE SANOFI 	850 mg 	Comprimé pelliculé 	B/30 	METFORMINE 	WINTHROP PHARMA TUNISIE 	Tunisie 	9103751 	2010-05-06 	Générique
  //
  //
  // METFORMINE SANOFI 	850 mg 	Comprimé pelliculé 	B/90 	METFORMINE 	WINTHROP PHARMA TUNISIE 	Tunisie 	9103753 	2012-10-17 	Générique
  //
  //
  // METFORMINE SANOFI 	1000 MG 	Comprimé pelliculé sécable 	B/30 	METFORMINE 	WINTHROP PHARMA TUNISIE 	Tunisie 	9103752 	2010-05-06 	Générique
  //
  //
  // METFORMINE SANOFI 	1000 mg 	Comprimé pelliculé sécable 	B/90 	METFORMINE 	WINTHROP PHARMA TUNISIE 	Tunisie 	9103754 	2012-10-17 	Générique
  // METFORMINE SANOFI 	850 mg 	Comprimé pelliculé 	B/30 	METFORMINE 	SANOFI AVENTIS PHARMA TUNISIE 	Tunisie 	ST9263381 	2021-08-30 	Générique
  // METFORMINE SANOFI 	1000 MG 	Comprimé pelliculé sécable 	B/30 	METFORMINE 	SANOFI AVENTIS PHARMA TUNISIE 	Tunisie 	ST9263383 	2021-08-30 	Générique
  // MI-DIABENIL 	2.5 MG 	Comprimé 	B/60 	GLIBENCLAMIDE 	DAR-ESSAYDALI. 	Tunisie 	9213031 	1999-08-03 	Générique
  // MIXTARD 30 	100 UI/ML 	Suspension injectable 	FL/10 ML 	INSULINE HUMAINE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993018 	2001-11-28 	Princeps
  //
  //
  // MIXTARD 30 PENFILL 	100 UI/ML 	Suspension injectable 	B/5/3 ML 	INSULINE HUMAINE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993025 	2001-12-12 	Princeps
  //
  //
  // MONOREL 	1 mg 	Comprimé sécable 	B/90 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213215 	2014-03-19 	Générique
  // MONOREL 	4 mg 	Comprimé sécable 	B/90 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213218 	2014-03-19 	Générique
  // MONOREL 	3 mg 	Comprimé sécable 	B/90 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213217 	2014-03-19 	Générique
  // MONOREL 	2 mg 	Comprimé sécable 	B/90 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213216 	2014-03-19 	Générique
  // MONOREL 	6 mg 	Comprimé sécable 	B/30 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	92132111 	2020-07-20 	Générique
  // MONOREL 	6 mg 	Comprimé sécable 	B/90 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	92132110 	2019-03-18 	Générique
  // MONOREL 	1 mg 	Comprimé sécable 	B/30 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213211 	2006-03-28 	Générique
  // MONOREL 	2 mg 	Comprimé sécable 	B/30 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213212 	2006-03-28 	Générique
  // MONOREL 	3 mg 	Comprimé sécable 	B/30 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213213 	2006-03-28 	Générique
  // MONOREL 	4 mg 	Comprimé sécable 	B/30 	GLIMEPIRIDE 	DAR-ESSAYDALI. 	Tunisie 	9213214 	2006-03-28 	Générique
  // NOVOMIX 30 FLEXPEN 	100 UI/ML 	Suspension injectable 	B/5/stylos pré-remplies/3 ML 	INSULINE ANALOGUE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993082 	2007-02-28 	Princeps
  //
  //
  // NOVOMIX 50 FLEXPEN 	100 UI/ML 	Suspension injectable 	B/5/stylos pré-remplies/3 ML 	INSULINE ANALOGUE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993083 	2014-04-02 	Princeps
  // NOVONORM 	2 mg 	Comprimé 	B/90 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993066 	2013-09-11 	Princeps
  // NOVONORM 	0.5 mg 	Comprimé 	B/90 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993064 	2013-09-11 	Princeps
  // NOVONORM 	1 mg 	Comprimé 	B/90 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993065 	2013-09-11 	Princeps
  // NOVONORM 	2 MG 	Comprimé 	B/30 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993063 	2005-03-16 	Princeps
  // NOVONORM 	1 MG 	Comprimé 	B/30 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993062 	2002-10-02 	Princeps
  // NOVONORM 	0.5 MG 	Comprimé 	B/30 	REPAGLINIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993061 	2002-10-02 	Princeps
  // NOVORAPID FLEXPEN 	100 UI/ML 	Solution injectable 	B/5 stylos pré-remplis/3 ML 	INSULINE ANALOGUE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993081 	2007-02-28 	Princeps
  //
  //
  // PIAGTOS 	30 mg 	Comprimé 	FL/30 	PIOGLITAZONE 	TERIAK 	Tunisie 	9253392 	2009-08-22 	Générique
  // PIAGTOS 	15 MG 	Comprimé 	FL/30 	PIOGLITAZONE 	TERIAK 	Tunisie 	9253391 	2008-06-25 	Générique
  // REPAGLINID SANDOZ 	0.5 MG 	Comprimé 	B/90 	REPAGLINIDE 	SANDOZ GmbH 	AUTRICHE 	11073071 	2019-09-17 	Générique
  // REPAGLINID SANDOZ 	1MG 	Comprimé 	B/90 	REPAGLINIDE 	SANDOZ GmbH 	AUTRICHE 	11073072 	2019-08-22 	Générique
  // REPAGLINID SANDOZ 	2MG 	Comprimé 	B/90 	REPAGLINIDE 	SANDOZ GmbH 	AUTRICHE 	11073073 	2019-08-22 	Générique
  // RYZODEG FLEX TOUCH 	100 U /ml 	Solution injectable 	B/ 5 stylos préremplis de 3 ml 	INSULINE ASPARTE + INSULINE DEGLUDEC 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993141 	2020-08-06 	Princeps
  //
  //
  //
  //
  // SITA 100 	100 mg 	Comprimé pelliculé 	B/28 	SITAGLIPTINE 	TERIAK 	Tunisie 	9254102 	2019-02-06 	Générique
  //
  //
  //
  //
  // SITA 50 	50 mg 	Comprimé pelliculé 	B/30 	SITAGLIPTINE 	TERIAK 	Tunisie 	9254101 	2019-02-06 	Générique
  // SITAGLIP 	100 mg 	Comprimé pelliculé 	B/30 	SITAGLIPTINE 	THERA 	Tunisie 	9403061 	2019-06-19 	Générique
  //
  //
  //
  //
  // SITAVIA 	100 mg 	Comprimé pelliculé sécable 	B/30 	SITAGLIPTINE 	IBN AL BAYTAR 	Tunisie 	9073641 	2016-12-22 	Générique
  // SITAVIA PLUS 	50 mg/1000mg 	Comprimé pelliculé 	B/56 	SITAGLIPTINE+METFORMINE 	IBN AL BAYTAR 	Tunisie 	9073642 	2017-01-04 	Générique
  // SOPHAMET 850 	850 mg 	Comprimé pelliculé 	B/30 	METFORMINE 	SOPHARMA SA 	BULGARIE 	10793031 	2020-08-06 	Générique
  // STAGID 	700 mg 	Comprimé sécable 	B/30 	METFORMINE 	SAIPH 	Tunisie 	9164091 	2018-10-08 	Princeps
  // SUCRAZIDE 	5 MG 	Comprimé sécable 	B/30 	GLIPIZIDE 	Dar Al Dawa Development and Investment Co.Ltd 	Jordanie 	5403131 	1993-03-15 	Générique
  // THERADIAM 	60 mg 	COMPRIME SECABLE A LIBERATION MODIFIEE 	B/60 	GLICLAZIDE 	THERA 	Tunisie 	9403152 	2021-12-31 	Générique
  //
  //
  //
  //
  // THERADIAM 	60 mg 	COMPRIME SECABLE A LIBERATION MODIFIEE 	B/30 	GLICLAZIDE 	THERA 	Tunisie 	9403151 	2021-12-31 	Générique
  //
  //
  //
  //
  // TOUJEO SOLOSTAR 	300unités/ml 	Solution injectable 	B/3Stylos/1.5ml 	INSULINE GLARGINE 	SANOFI-AVENTIS Deutschland GmbH 	Germany 	1823041 	2021-01-26 	Princeps
  // TRAJENTA 	5 mg 	Comprimé pelliculé 	B/28 	LINAGLIPTINE 	BOEHRINGER ING.INT.GmbH 	Germany 	11533061 	2017-02-20 	Princeps
  //
  //
  //
  //
  // TRESIBA FLEXTOUCH 	100 U/ ML 	Solution injectable 	B/5 stylos préremplis de 3 ml 	INSULINE DEGLUDEC 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993131 	2019-08-22 	Princeps
  // TRESIBA FLEXTOUCH 	200 U/ ML 	Solution injectable 	B/3 stylos préremplis de 3 ml 	INSULINE DEGLUDEC 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993132 	2019-08-22 	Princeps
  // VICTOZA 	6 mg/ml 	Solution injectable 	B/ 2 stylos/ 3ml 	LIRAGLUTIDE 	NOVO NORDISK A/S Bagsvaerd 	Denmark 	5993111 	2013-09-10 	Princeps
  // VILDA 	50 mg 	Comprimé 	B/30 	VILDAGLIPTINE 	PHILADELPHIA PHARMA 	Tunisie 	9353201 	2018-03-07 	Générique
  // VILDAMET 	50 mg/1000 mg 	Comprimé pelliculé 	B/60 	VILDAGLIPTINE+METFORMINE 	PHILADELPHIA PHARMA 	Tunisie 	9353281 	2021-03-30 	Générique
  // VILDAMET 	50 mg/1000 mg 	Comprimé pelliculé 	B/30 	VILDAGLIPTINE+METFORMINE 	PHILADELPHIA PHARMA 	Tunisie 	9353282 	2021-12-30 	Générique
  // VILDYNE 	50 mg 	Comprimé 	B/30 	VILDAGLIPTINE 	TAHA PHARMA 	Tunisie 	9373471 	2018-03-07 	Générique
  // VILDYNE 	50 mg 	Comprimé 	B/60 	VILDAGLIPTINE 	TAHA PHARMA 	Tunisie 	9373472 	2019-05-02 	Génériq

  ];
  final recentmedicaments = [];
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, ""); //null
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, query) //null

      ,
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.medication,
          size: 120,
        ),
        const SizedBox(
          height: 48,
        ),
        Text(
          query,
          style: TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentmedicaments
        : medicaments.where((medic) {
      final mediclower = medic.toLowerCase();
      final queryLower = query.toLowerCase();

      return mediclower.startsWith(queryLower);
    }).toList();
    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<dynamic> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          leading: Icon(Icons.medication),
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            // close(context, suggestion);
            close(context, query);
          },
        );
      });
}