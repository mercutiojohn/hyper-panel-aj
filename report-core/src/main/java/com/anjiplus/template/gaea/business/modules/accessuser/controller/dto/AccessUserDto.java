
package com.anjiplus.template.gaea.business.modules.accessuser.controller.dto;

import com.anji.plus.gaea.curd.dto.GaeaBaseDTO;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
*
* @description 用户管理 dto
* @author Devli
* @date 2019-02-17 08:50:11.902
**/
@Data
public class AccessUserDto extends GaeaBaseDTO implements Serializable {

    /**  登录名 */
    @NotEmpty(message = "6002")
    private String loginName;

    /** 真实用户 */
    @NotEmpty(message = "6002")
    private String realName;

    /** 手机号码 */
    private String phone;

    /** 用户邮箱 */
    private String email;

    /** 0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG */
    @NotNull(message = "6002")
    private Integer enableFlag;

    /**  0--未删除 1--已删除 DIC_NAME=DEL_FLAG */
    private Integer deleteFlag;

    /** 最后一次登录IP */
    private String lastLoginIp;

    /** 最后一次登陆时间 */
    private Date lastLoginTime;

    /** 备注 */
    private String remark;

    /** 用户勾选的角色 */
    private List<String> roleCodeList;
}
