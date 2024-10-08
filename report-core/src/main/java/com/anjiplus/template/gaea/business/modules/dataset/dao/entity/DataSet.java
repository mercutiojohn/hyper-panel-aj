
package com.anjiplus.template.gaea.business.modules.dataset.dao.entity;

import com.anji.plus.gaea.annotation.Unique;
import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
* @description 数据集 entity
* @author Raod
* @date 2021-03-18 12:11:31.150755900
**/
@TableName(keepGlobalPrefix=true, value="gaea_report_data_set")
@Data
public class DataSet extends GaeaBaseEntity {

    /** 数据集编码 */
    @Unique(code = ResponseCode.SET_CODE_ISEXIST)
    private String setCode;

    /** 数据集名称 */
    private String setName;

    /** 数据集描述 */
    private String setDesc;

    /** 数据集类型 */
    private String setType;

    /** 数据源编码 */
    private String sourceCode;

    /** 动态查询sql或者接口中的请求体 */
    private String dynSentence;

    /** 结果案例 */
    private String caseResult;

    /** 0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG */
    private Integer enableFlag;

    /** 0--未删除 1--已删除 DIC_NAME=DELETE_FLAG */
    private Integer deleteFlag;


}
