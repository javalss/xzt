/**
 * Copyright &copy; 2012-2016  All rights reserved.
 */
package com.ambition.agile.modules.gen.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ambition.agile.common.persistence.Page;
import com.ambition.agile.common.web.BaseController;
import com.ambition.agile.modules.gen.entity.GenTemplate;
import com.ambition.agile.modules.gen.service.GenTemplateService;
import com.ambition.agile.modules.sys.entity.User;
import com.ambition.agile.modules.sys.utils.UserUtils;

/**
 * 代码模板Controller
 * @author harry
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genTemplate")
public class GenTemplateController extends BaseController {

	@Autowired
	private GenTemplateService genTemplateService;
	
	@ModelAttribute
	public GenTemplate get(@RequestParam(required=false) Integer id) {
		if (id!=null&&id>0){
			return genTemplateService.get(id);
		}else{
			return new GenTemplate();
		}
	}
	
	@RequiresPermissions("gen:genTemplate:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenTemplate genTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			genTemplate.setCreateBy(user);
		}
        Page<GenTemplate> page = genTemplateService.find(new Page<GenTemplate>(request, response), genTemplate); 
        model.addAttribute("page", page);
		return "modules/gen/genTemplateList";
	}

	@RequiresPermissions("gen:genTemplate:view")
	@RequestMapping(value = "form")
	public String form(GenTemplate genTemplate, Model model) {
		model.addAttribute("genTemplate", genTemplate);
		return "modules/gen/genTemplateForm";
	}

	@RequiresPermissions("gen:genTemplate:edit")
	@RequestMapping(value = "save")
	public String save(GenTemplate genTemplate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genTemplate)){
			return form(genTemplate, model);
		}
		genTemplateService.save(genTemplate);
		addMessage(redirectAttributes, "保存代码模板'" + genTemplate.getName() + "'成功");
		return "redirect:" + adminPath + "/gen/genTemplate/?repage";
	}
	
	@RequiresPermissions("gen:genTemplate:edit")
	@RequestMapping(value = "delete")
	public String delete(GenTemplate genTemplate, RedirectAttributes redirectAttributes) {
		genTemplateService.delete(genTemplate);
		addMessage(redirectAttributes, "删除代码模板成功");
		return "redirect:" + adminPath + "/gen/genTemplate/?repage";
	}

}
