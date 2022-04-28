package com.easycompany.cmm.tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class AppendReplayTag extends TagSupport {

	private static final long serialVersionUID = 1L;

	private int depth = 0;

	public int doEndTag() throws JspException {

		try {
	
			JspWriter out = pageContext.getOut();
			String contents = "";
			for (int i = 0; i < depth; i++) {
				contents += "&nbsp;Re:";
			}
			out.println(contents);
	
		return EVAL_PAGE;
	
		} catch (IOException e) {
			throw new JspException();
		}
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

}