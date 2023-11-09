//
//  TDPresetConstant.h
//  DevelopProgram
//
//  Created by huangdiao on 2023/10/24.
//

#ifndef TDPresetConstant_h
#define TDPresetConstant_h

//MARK: - Currency Type of Payment Event
typedef NS_ENUM(NSUInteger, TDCurrencyType) {
    TDCurrencyTypeNONE = 0,
    TDCurrencyTypeAED,
    TDCurrencyTypeAFN,
    TDCurrencyTypeALL,
    TDCurrencyTypeAMD,
    TDCurrencyTypeANG,
    TDCurrencyTypeAOA,
    TDCurrencyTypeARS,
    TDCurrencyTypeAUD,
    TDCurrencyTypeAWG,
    TDCurrencyTypeAZN,
    TDCurrencyTypeBAM,
    TDCurrencyTypeBBD,
    TDCurrencyTypeBDT,
    TDCurrencyTypeBGN,
    TDCurrencyTypeBHD,
    TDCurrencyTypeBIF,
    TDCurrencyTypeBMD,
    TDCurrencyTypeBND,
    TDCurrencyTypeBOB,
    TDCurrencyTypeBRL,
    TDCurrencyTypeBSD,
    TDCurrencyTypeBTC,
    TDCurrencyTypeBTN,
    TDCurrencyTypeBWP,
    TDCurrencyTypeBYN,
    TDCurrencyTypeBYR,
    TDCurrencyTypeBZD,
    TDCurrencyTypeCAD,
    TDCurrencyTypeCDF,
    TDCurrencyTypeCHF,
    TDCurrencyTypeCLF,
    TDCurrencyTypeCLP,
    TDCurrencyTypeCNY,
    TDCurrencyTypeCOP,
    TDCurrencyTypeCRC,
    TDCurrencyTypeCUC,
    TDCurrencyTypeCUP,
    TDCurrencyTypeCVE,
    TDCurrencyTypeCZK,
    TDCurrencyTypeDJF,
    TDCurrencyTypeDKK,
    TDCurrencyTypeDOP,
    TDCurrencyTypeDZD,
    TDCurrencyTypeEGP,
    TDCurrencyTypeERN,
    TDCurrencyTypeETB,
    TDCurrencyTypeEUR,
    TDCurrencyTypeFJD,
    TDCurrencyTypeFKP,
    TDCurrencyTypeGBP,
    TDCurrencyTypeGEL,
    TDCurrencyTypeGGP,
    TDCurrencyTypeGHS,
    TDCurrencyTypeGIP,
    TDCurrencyTypeGMD,
    TDCurrencyTypeGNF,
    TDCurrencyTypeGTQ,
    TDCurrencyTypeGYD,
    TDCurrencyTypeHKD,
    TDCurrencyTypeHNL,
    TDCurrencyTypeHRK,
    TDCurrencyTypeHTG,
    TDCurrencyTypeHUF,
    TDCurrencyTypeIDR,
    TDCurrencyTypeILS,
    TDCurrencyTypeIMP,
    TDCurrencyTypeINR,
    TDCurrencyTypeIQD,
    TDCurrencyTypeIRR,
    TDCurrencyTypeISK,
    TDCurrencyTypeJEP,
    TDCurrencyTypeJMD,
    TDCurrencyTypeJOD,
    TDCurrencyTypeJPY,
    TDCurrencyTypeKES,
    TDCurrencyTypeKGS,
    TDCurrencyTypeKHR,
    TDCurrencyTypeKMF,
    TDCurrencyTypeKPW,
    TDCurrencyTypeKRW,
    TDCurrencyTypeKWD,
    TDCurrencyTypeKYD,
    TDCurrencyTypeKZT,
    TDCurrencyTypeLAK,
    TDCurrencyTypeLBP,
    TDCurrencyTypeLKR,
    TDCurrencyTypeLRD,
    TDCurrencyTypeLSL,
    TDCurrencyTypeLTL,
    TDCurrencyTypeLVL,
    TDCurrencyTypeLYD,
    TDCurrencyTypeMAD,
    TDCurrencyTypeMDL,
    TDCurrencyTypeMGA,
    TDCurrencyTypeMKD,
    TDCurrencyTypeMMK,
    TDCurrencyTypeMNT,
    TDCurrencyTypeMOP,
    TDCurrencyTypeMRO,
    TDCurrencyTypeMUR,
    TDCurrencyTypeMVR,
    TDCurrencyTypeMWK,
    TDCurrencyTypeMXN,
    TDCurrencyTypeMYR,
    TDCurrencyTypeMZN,
    TDCurrencyTypeNAD,
    TDCurrencyTypeNGN,
    TDCurrencyTypeNIO,
    TDCurrencyTypeNOK,
    TDCurrencyTypeNPR,
    TDCurrencyTypeNZD,
    TDCurrencyTypeOMR,
    TDCurrencyTypePAB,
    TDCurrencyTypePEN,
    TDCurrencyTypePGK,
    TDCurrencyTypePHP,
    TDCurrencyTypePKR,
    TDCurrencyTypePLN,
    TDCurrencyTypePYG,
    TDCurrencyTypeQAR,
    TDCurrencyTypeRON,
    TDCurrencyTypeRSD,
    TDCurrencyTypeRUB,
    TDCurrencyTypeRWF,
    TDCurrencyTypeSAR,
    TDCurrencyTypeSBD,
    TDCurrencyTypeSCR,
    TDCurrencyTypeSDG,
    TDCurrencyTypeSEK,
    TDCurrencyTypeSGD,
    TDCurrencyTypeSHP,
    TDCurrencyTypeSLL,
    TDCurrencyTypeSOS,
    TDCurrencyTypeSRD,
    TDCurrencyTypeSTD,
    TDCurrencyTypeSVC,
    TDCurrencyTypeSYP,
    TDCurrencyTypeSZL,
    TDCurrencyTypeTHB,
    TDCurrencyTypeTJS,
    TDCurrencyTypeTMT,
    TDCurrencyTypeTND,
    TDCurrencyTypeTOP,
    TDCurrencyTypeTRY,
    TDCurrencyTypeTTD,
    TDCurrencyTypeTWD,
    TDCurrencyTypeTZS,
    TDCurrencyTypeUAH,
    TDCurrencyTypeUGX,
    TDCurrencyTypeUSD,
    TDCurrencyTypeUYU,
    TDCurrencyTypeUZS,
    TDCurrencyTypeVEF,
    TDCurrencyTypeVND,
    TDCurrencyTypeVUV,
    TDCurrencyTypeWST,
    TDCurrencyTypeXAF,
    TDCurrencyTypeXAG,
    TDCurrencyTypeXAU,
    TDCurrencyTypeXCD,
    TDCurrencyTypeXDR,
    TDCurrencyTypeXOF,
    TDCurrencyTypeXPF,
    TDCurrencyTypeYER,
    TDCurrencyTypeZAR,
    TDCurrencyTypeZMK,
    TDCurrencyTypeZMW,
    TDCurrencyTypeZWL
};


#endif /* TDPresetConstant_h */
