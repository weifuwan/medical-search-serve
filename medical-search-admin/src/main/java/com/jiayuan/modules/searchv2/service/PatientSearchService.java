package com.jiayuan.modules.searchv2.service;

import com.jiayuan.modules.searchv2.dto.PatientCountVO;
import com.jiayuan.modules.searchv2.dto.PatientListVO;
import com.jiayuan.modules.searchv2.dto.PatientSearchRequest;

/** Patient-scope search APIs backed by the V2 matching pipeline. */
public interface PatientSearchService {

    PatientCountVO count(PatientSearchRequest request);

    PatientListVO list(PatientSearchRequest request);
}
