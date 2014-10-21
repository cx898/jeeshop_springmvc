<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<html>
<head>
<title>Pager Tag Library Demo</title>
<%
/*
 *  Pager Tag Library
 *
 *  Copyright (C) 2002  James Klicman <james@jsptags.com>
 *
 *  The latest release of this tag library can be found at
 *  http://jsptags.com/tags/navigation/pager/
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
%>
<style type="text/css">
A.nodec { text-decoration: none; }
</style>
</head>
<body bgcolor="#ffffff">
<table bgcolor="#ffcc00" width="100%" border="0"
	cellspacing="0" cellpadding="2">
<tr>
<td><table bgcolor="#3366cc" width="100%" border="0"
	cellspacing="0" cellpadding="4">
	<tr>
	<td width="379"><a href="http://jsptags.com/"><img src="images/jsptags.gif"
		alt="&lt;jsptags.com&gt; logo" width="379" height="65" border="0"></a></td>
	<td width="100%" align="center"><a href="http://jsptags.com/tags/navigation/pager/" class="nodec"><font color="#ffffff" size="+2"><b>
		Pager Tag Library v2.0</b></font></a></td>
	</tr>
	</table></td>
</tr>
</table>

<%
    String style = getParam(request, "style", "simple");
    String position = getParam(request, "position", "top");
    String index = getParam(request, "index", "center");
    int maxPageItems = getParam(request, "maxPageItems", 10);
    int maxIndexPages = getParam(request, "maxIndexPages", 10);
%>
<form action="<%= request.getRequestURI() %>" method="get">
<center>
<table border="0" width="90%" cellpadding="4">
<tr valign="top">
<td rowspan="2" align="center">
    <table border="0" cellspacing="2" cellpadding="0">
    <tr><th colspan="2">Style</th></tr>
    <tr><td><% radio(pageContext, "style", "simple", true); %></td>
	<td>Simple</td></tr>
    <tr><td><% radio(pageContext, "style", "texticon", false); %></td>
	<td>Text Icon</td></tr>
    <tr><td><% radio(pageContext, "style", "jsptags", false); %></td>
	<td><a target="_blank" href="http://jsptags.com/">JSPTags.com</a></td></tr>
    <tr><td><% radio(pageContext, "style", "alltheweb", false); %></td>
	<td><a target="_blank" href="http://www.alltheweb.com/">AllTheWeb</a></td></tr>
    <tr><td><% radio(pageContext, "style", "altavista", false); %></td>
	<td><a target="_blank" href="http://www.altavista.com/">AltaVista</a></td></tr>
    <tr><td><% radio(pageContext, "style", "google", false); %></td>
	<td><a target="_blank" href="http://www.google.com/"><font color="#0000cc">G</font><font color="#cccc00">oo</font><font color="#0000cc">g</font><font color="#00cc00">l</font><font color="#cc0000">e</font></a></td></tr>
    <tr><td><% radio(pageContext, "style", "lycos", false); %></td>
	<td><a target="_blank" href="http://www.lycos.com/">Lycos</a></td></tr>
    <tr><td><% radio(pageContext, "style", "yahoo", false); %></td>
	<td><a target="_blank" href="http://www.yahoo.com/">Yahoo!</a></td></tr>
    </table>
</td>
<td>
    <table border="0" cellspacing="2" cellpadding="0">
    <tr><th colspan="2">Position</th></tr>
    <tr><td><% radio(pageContext, "position", "top", true); %></td>
	<td>Top</td></tr>
    <tr><td><% radio(pageContext, "position", "bottom", false); %></td>
	<td>Bottom</td></tr>
    <tr><td><% radio(pageContext, "position", "both", false); %></td>
	<td>Top&nbsp;&amp;&nbsp;Bottom</td></tr>
    </table>
</td>
<td>
    <table border="0" cellspacing="2" cellpadding="0">
    <tr><th colspan="2">Index</th></tr>
    <tr><td><% radio(pageContext, "index", "center", true); %></td>
	<td>Center</td></tr>
    <tr><td><% radio(pageContext, "index", "forward", false); %></td>
	<td>Forward</td></tr>
    <tr><td><% radio(pageContext, "index", "half-full", false); %></td>
	<td>Half-Full</td></tr>
    </table>
</td>
<td rowspan="2" width="100%">
  <p>This demo of the Pager Tag Library displays the web safe color palette
  as its data source. Some of the available pager options may be changed
  using the adjacent form.</p>
  <% if ("jsptags".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> JSPTags.com Emulation Settings<br>
	<table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index:</td><td>Center</td></tr>
	<tr><td>Max. Page Items:</td><td>10</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>10</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else if ("google".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> <font color="#0000cc">G</font><font color="#cccc00">oo</font><font color="#0000cc">g</font><font color="#00cc00">l</font><font color="#cc0000">e</font> Emulation Settings<br>
	<table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index:</td><td>Half-Full</td></tr>
	<tr><td>Max. Page Items:</td><td>10</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>20</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else if ("altavista".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> AltaVista Emulation Settings<br>
        <table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index:</td><td>Center</td></tr>
	<tr><td>Max. Page Items:</td><td>10</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>10</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else if ("lycos".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> Lycos Emulation Settings<br>
        <table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index: </td><td>Forward</td></tr>
	<tr><td>Max. Page Items: </td><td>10</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>4</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else if ("yahoo".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> Yahoo! Emulation Settings<br>
        <table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index: </td><td>N/A</td></tr>
	<tr><td>Max. Page Items: </td><td>20</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>N/A</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else if ("alltheweb".equals(style)) { %>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr valign="top">
    <td><input type="submit" value="Update"></td>
    <td>&nbsp;&nbsp;</td>
    <td> AllTheWeb Emulation Settings<br>
        <table border="0" cellspacing="0" cellpadding="0">
	<tr><td>Index: </td><td>Center</td></tr>
	<tr><td>Max. Page Items: </td><td>10</td></tr>
	<tr><td>Max. Index Pages:&nbsp;</td><td>7</td></tr>
	</table>
	</td>
    </tr>
    </table>
  <% } else { %>
  <p><input type="submit" value="Update"></p>
  <% } %>
</td>
</tr>
<tr>
<td colspan="2" align="center" valign="top">
    <table border="0" cellspacing="2" cellpadding="0">
    <tr><td>Max.&nbsp;Page&nbsp;Items&nbsp;</td>
	<td><input type="text" size="4" name="maxPageItems" value="<%= maxPageItems %>" onChange="this.form.submit();"></td></tr>
    <tr><td>Max.&nbsp;Index&nbsp;Pages&nbsp;</td>
	<td><input type="text" size="4" name="maxIndexPages" value="<%= maxIndexPages %>" onChange="this.form.submit();"></td></tr>
    </table>
</td>
</tr>
</table>

<pg:pager
    items="<%= webPalette.length %>"
    index="<%= index %>"
    maxPageItems="<%= maxPageItems %>"
    maxIndexPages="<%= maxIndexPages %>"
    isOffset="<%= true %>"
    export="offset,currentPageNumber=pageNumber"
    scope="request">
<%-- keep track of preference --%>
  <pg:param name="style"/>
  <pg:param name="position"/>
  <pg:param name="index"/>
  <pg:param name="maxPageItems"/>
  <pg:param name="maxIndexPages"/>

  <%-- save pager offset during form changes --%>
  <input type="hidden" name="pager.offset" value="<%= offset %>">

  <%-- warn if offset is not a multiple of maxPageItems --%>
  <% if (offset.intValue() % maxPageItems != 0 &&
         ("alltheweb".equals(style) || "lycos".equals(style)) )
     {
  %>
    <p>Warning: The current page offset is not a multiple of Max. Page Items.
    <br>Please
    <pg:first><a href="<%= pageUrl %>">return to the first page</a></pg:first>
    if any displayed range numbers appear incorrect.</p>
  <% } %>

  <%-- the pg:pager items attribute must be set to the total number of
       items for index before items to work properly --%>
  <% if ("top".equals(position) || "both".equals(position)) { %>
    <br>
    <pg:index>
      <% if ("texticon".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/texticon.jsp" flush="true"/>
      <% } else if ("jsptags".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/jsptags.jsp" flush="true"/>
      <% } else if ("google".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/google.jsp" flush="true"/>
      <% } else if ("altavista".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/altavista.jsp" flush="true"/>
      <% } else if ("lycos".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/lycos.jsp" flush="true"/>
      <% } else if ("yahoo".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/yahoo.jsp" flush="true"/>
      <% } else if ("alltheweb".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/alltheweb.jsp" flush="true"/>
      <% } else { %>
  	<jsp:include page="/WEB-INF/jsp/simple.jsp" flush="true"/>
      <% } %>
    </pg:index>
  <% } %>

  <hr>
  <table width="90%" cellspacing="4" cellpadding="4">
  <%--
    Since the data source is static, it's easy to offset and limit the
    loop for efficiency. If the data set size is not known or cannot
    be easily offset, the pager tag library can count the items and display
    the correct subset for you.

    The following is an example using an enumeration data source of
    unknown size. The pg:pager items and isOffset attributes must
    not be set for this example:

    <% while (enumeration.hasMoreElements()) { %>
	<pg:item><%= enumeration.nextElement() %><br></pg:item>
    <% } %>

   --%>
  <%
	for (int i = offset.intValue(),
	         l = Math.min(i + maxPageItems, webPalette.length);
	     i < l; i++)
	{
		%><pg:item>
<tr><th bgcolor="<%= webPalette[i][0] %>"><font color="<%= webPalette[i][1] %>"><%= i + 1 %></font></th></tr></pg:item><%
	}
  %>
  </table>
  <hr>

<% if ("bottom".equals(position) || "both".equals(position)) { %>
  <pg:index>
    <% if ("texticon".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/texticon.jsp" flush="true"/>
    <% } else if ("jsptags".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/jsptags.jsp" flush="true"/>
    <% } else if ("google".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/google.jsp" flush="true"/>
    <% } else if ("altavista".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/altavista.jsp" flush="true"/>
    <% } else if ("lycos".equals(style)) { %>
  	<jsp:include page="/WEB-INF/jsp/lycos.jsp" flush="true"/>
    <% } else if ("yahoo".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/yahoo.jsp" flush="true"/>
    <% } else if ("alltheweb".equals(style)) { %>
	<jsp:include page="/WEB-INF/jsp/alltheweb.jsp" flush="true"/>
    <% } else { %>
	<jsp:include page="/WEB-INF/jsp/simple.jsp" flush="true"/>
    <% } %>
  </pg:index>
<% } %>
</pg:pager>
</center>
</body>
</html>
<%!
private static final String BLACK = "#000000", WHITE = "#ffffff";
private static final String[][] webPalette = {
    { WHITE,   BLACK},
    {"#cccccc",BLACK},
    {"#999999",BLACK},
    {"#666666",WHITE},
    {"#333333",WHITE},
    { BLACK,   WHITE},
    {"#ffcc00",BLACK},
    {"#ff9900",BLACK},
    {"#ff6600",BLACK},
    {"#ff3300",WHITE},
    {"#99cc00",BLACK},
    {"#cc9900",BLACK},
    {"#ffcc33",BLACK},
    {"#ffcc66",BLACK},
    {"#ff9966",BLACK},
    {"#ff6633",BLACK},
    {"#cc3300",WHITE},
    {"#cc0033",WHITE},
    {"#ccff00",BLACK},
    {"#ccff33",BLACK},
    {"#333300",WHITE},
    {"#666600",WHITE},
    {"#999900",BLACK},
    {"#cccc00",BLACK},
    {"#ffff00",BLACK},
    {"#cc9933",BLACK},
    {"#cc6633",WHITE},
    {"#330000",WHITE},
    {"#660000",WHITE},
    {"#990000",WHITE},
    {"#cc0000",WHITE},
    {"#ff0000",WHITE},
    {"#ff3366",WHITE},
    {"#ff0033",WHITE},
    {"#99ff00",BLACK},
    {"#ccff66",BLACK},
    {"#99cc33",BLACK},
    {"#666633",WHITE},
    {"#999933",BLACK},
    {"#cccc33",BLACK},
    {"#ffff33",BLACK},
    {"#996600",WHITE},
    {"#993300",WHITE},
    {"#663333",WHITE},
    {"#993333",WHITE},
    {"#cc3333",WHITE},
    {"#ff3333",WHITE},
    {"#cc3366",WHITE},
    {"#ff6699",BLACK},
    {"#ff0066",WHITE},
    {"#66ff00",BLACK},
    {"#99ff66",BLACK},
    {"#66cc33",BLACK},
    {"#669900",WHITE},
    {"#999966",BLACK},
    {"#cccc66",BLACK},
    {"#ffff66",BLACK},
    {"#996633",WHITE},
    {"#663300",WHITE},
    {"#996666",WHITE},
    {"#cc6666",BLACK},
    {"#ff6666",BLACK},
    {"#990033",WHITE},
    {"#cc3399",WHITE},
    {"#ff66cc",BLACK},
    {"#ff0099",WHITE},
    {"#33ff00",BLACK},
    {"#66ff33",BLACK},
    {"#339900",WHITE},
    {"#66cc00",BLACK},
    {"#99ff33",BLACK},
    {"#cccc99",BLACK},
    {"#ffff99",BLACK},
    {"#cc9966",BLACK},
    {"#cc6600",WHITE},
    {"#cc9999",BLACK},
    {"#ff9999",BLACK},
    {"#ff3399",WHITE},
    {"#cc0066",WHITE},
    {"#990066",WHITE},
    {"#ff33cc",BLACK},
    {"#ff00cc",WHITE},
    {"#00cc00",WHITE},
    {"#33cc00",BLACK},
    {"#336600",WHITE},
    {"#669933",WHITE},
    {"#99cc66",BLACK},
    {"#ccff99",BLACK},
    {"#ffffcc",BLACK},
    {"#ffcc99",BLACK},
    {"#ff9933",BLACK},
    {"#ffcccc",BLACK},
    {"#ff99cc",BLACK},
    {"#cc6699",BLACK},
    {"#993366",WHITE},
    {"#660033",WHITE},
    {"#cc0099",WHITE},
    {"#330033",WHITE},
    {"#33cc33",BLACK},
    {"#66cc66",BLACK},
    {"#00ff00",BLACK},
    {"#33ff33",BLACK},
    {"#66ff66",BLACK},
    {"#99ff99",BLACK},
    {"#ccffcc",BLACK},
    {"#cc99cc",BLACK},
    {"#996699",WHITE},
    {"#993399",WHITE},
    {"#990099",WHITE},
    {"#663366",WHITE},
    {"#660066",WHITE},
    {"#006600",WHITE},
    {"#336633",WHITE},
    {"#009900",WHITE},
    {"#339933",WHITE},
    {"#669966",BLACK},
    {"#99cc99",BLACK},
    {"#ffccff",BLACK},
    {"#ff99ff",BLACK},
    {"#ff66ff",BLACK},
    {"#ff33ff",BLACK},
    {"#ff00ff",WHITE},
    {"#cc66cc",BLACK},
    {"#cc33cc",WHITE},
    {"#003300",WHITE},
    {"#00cc33",WHITE},
    {"#006633",WHITE},
    {"#339966",WHITE},
    {"#66cc99",BLACK},
    {"#99ffcc",BLACK},
    {"#ccffff",BLACK},
    {"#3399ff",BLACK},
    {"#99ccff",BLACK},
    {"#ccccff",BLACK},
    {"#cc99ff",BLACK},
    {"#9966cc",BLACK},
    {"#663399",WHITE},
    {"#330066",WHITE},
    {"#9900cc",WHITE},
    {"#cc00cc",WHITE},
    {"#00ff33",BLACK},
    {"#33ff66",BLACK},
    {"#009933",WHITE},
    {"#00cc66",BLACK},
    {"#33ff99",BLACK},
    {"#99ffff",BLACK},
    {"#99cccc",BLACK},
    {"#0066cc",WHITE},
    {"#6699cc",BLACK},
    {"#9999ff",BLACK},
    {"#9999cc",BLACK},
    {"#9933ff",WHITE},
    {"#6600cc",WHITE},
    {"#660099",WHITE},
    {"#cc33ff",WHITE},
    {"#cc00ff",WHITE},
    {"#00ff66",BLACK},
    {"#66ff99",BLACK},
    {"#33cc66",BLACK},
    {"#009966",WHITE},
    {"#66ffff",BLACK},
    {"#66cccc",BLACK},
    {"#669999",BLACK},
    {"#003366",WHITE},
    {"#336699",WHITE},
    {"#6666ff",WHITE},
    {"#6666cc",WHITE},
    {"#666699",WHITE},
    {"#330099",WHITE},
    {"#9933cc",WHITE},
    {"#cc66ff",BLACK},
    {"#9900ff",WHITE},
    {"#00ff99",BLACK},
    {"#66ffcc",BLACK},
    {"#33cc99",BLACK},
    {"#33ffff",BLACK},
    {"#33cccc",BLACK},
    {"#339999",WHITE},
    {"#336666",WHITE},
    {"#006699",WHITE},
    {"#003399",WHITE},
    {"#3333ff",WHITE},
    {"#3333cc",WHITE},
    {"#333399",WHITE},
    {"#333366",WHITE},
    {"#6633cc",WHITE},
    {"#9966ff",BLACK},
    {"#6600ff",WHITE},
    {"#00ffcc",BLACK},
    {"#33ffcc",BLACK},
    {"#00ffff",BLACK},
    {"#00cccc",BLACK},
    {"#009999",WHITE},
    {"#006666",WHITE},
    {"#003333",WHITE},
    {"#3399cc",BLACK},
    {"#3366cc",WHITE},
    {"#0000ff",WHITE},
    {"#0000cc",WHITE},
    {"#000099",WHITE},
    {"#000066",WHITE},
    {"#000033",WHITE},
    {"#6633ff",WHITE},
    {"#3300ff",WHITE},
    {"#00cc99",BLACK},
    {"#0099cc",WHITE},
    {"#33ccff",BLACK},
    {"#66ccff",BLACK},
    {"#6699ff",BLACK},
    {"#3366ff",WHITE},
    {"#0033cc",WHITE},
    {"#3300cc",WHITE},
    {"#00ccff",BLACK},
    {"#0099ff",WHITE},
    {"#0066ff",WHITE},
    {"#0033ff",WHITE}
};


private static final String getParam(ServletRequest request, String name,
    String defval)
{
    String param = request.getParameter(name);
    return (param != null ? param : defval);
}

private static final int getParam(ServletRequest request, String name,
    int defval)
{
    String param = request.getParameter(name);
    int value = defval;
    if (param != null) {
	try { value = Integer.parseInt(param); }
	catch (NumberFormatException ignore) { }
    }
    return value;
}

private static void radio(PageContext pc, String name, String value,
    boolean isDefault) throws java.io.IOException
{
    JspWriter out = pc.getOut();
    String param = pc.getRequest().getParameter(name);
    out.write("<input type=\"radio\" name=\"");
    out.write(name);
    out.write("\" value=\"");
    out.write(value);
    out.write("\" onChange=\"this.form.submit();\"");
    if (value.equals(param) || (isDefault && param == null))
	out.write(" checked");
    out.write('>');
}
%>
