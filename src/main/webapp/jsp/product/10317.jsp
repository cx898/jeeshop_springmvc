<%@ page contentType="text/html; charset=UTF-8"%>
<div id="news_content" style="font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Java 8已于2014年3月18日正式发布了，<a href="http://www.iteye.com/news/28870-java-8-release" target="_blank">新版本带来了诸多改进</a>，包括Lambda表达式、Streams、日期时间API等等。<strong>本文就带你领略Java 8的全新特性。</strong>&nbsp;<br />
	<div style="text-align:center;">
		<img src="http://dl2.iteye.com/upload/attachment/0095/0238/4ee99502-b0bd-3782-a3e3-56c70cc765eb.jpg" /> 
	</div>
<br />
本文由&nbsp;<a href="http://www.importnew.com/" target="_blank">ImportNew</a>网站的<a href="http://www.importnew.com/author/huangxiaofei" target="_blank">黄小非</a>&nbsp;翻译自&nbsp;<a href="http://winterbe.com/posts/2014/03/16/java-8-tutorial/" target="_blank">winterbe</a>。原文作者Benjamin是<a href="http://www.pondus.de/" target="_blank">Pondus</a>软件公司的总工程师，<strong>原文内容如下。</strong>&nbsp;<br />
	<div class="quote_title" style="font-weight:bold;padding:5px;margin:5px 0px 0px 15px;">
		引用
	</div>
	<div class="quote_div" style="border:1px solid #CCCCCC;margin:0px 5px 5px 15px;padding:3px;background-color:#FAFAFA;">
		<strong>Java并没有没落，人们很快就会发现这一点</strong> 
	</div>
<br />
欢迎阅读我编写的<a href="https://jdk8.java.net/" target="_blank">Java 8</a>介绍。本教程将带领你一步一步地认识这门语言的新特性。通过简单明了的代码示例，你将会学习到如何使用默认接口方法，Lambda表达式，方法引用和重复注解。看完这篇教程后，你还将对最新推出的<a href="http://download.java.net/jdk8/docs/api/" target="_blank">API</a>有一定的了解，例如：流控制，函数式接口，map扩展和新的时间日期API等等。
</div>
<div id="interview_menu" style="background-color:#F5F5F5;border:1px solid #CCCCCC;margin:10px;padding:5px;font-family:Helvetica, Tahoma, Arial, sans-serif;">
	<h4 style="font-size:1.15em;">
		目 录&nbsp;<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#">[ - ]</a> 
	</h4>
	<ol style="font-size:1em;">
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#548">允许在接口中有默认方法实现</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#549">Lambda表达式</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#550">函数式接口</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#551">方法和构造函数引用</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#552">Lambda的范围</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#553">内置函数式接口</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#554">Streams</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#555">Parallel Streams</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#556">Map</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#557">时间日期API</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#558">Annotations</a> 
		</li>
		<li style="font-size:1em;">
			<a href="http://www.iteye.com/magazines/129-Java-8-Tutorial#559">总结</a> 
		</li>
	</ol>
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	允许在接口中有默认方法实现<span class="actions"><a name="548" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Java 8 允许我们使用default关键字，为接口声明添加非抽象的方法实现。这个特性又被称为扩展方法。下面是我们的第一个例子：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">interface</span>&nbsp;Formula&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">double</span>&nbsp;calculate(<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;a);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">default</span>&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">double</span>&nbsp;sqrt(<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;a)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;Math.sqrt(a);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
在接口Formula中，除了抽象方法caculate以外，还定义了一个默认方法sqrt。Formula的实现类只需要实现抽象方法caculate就可以了。默认方法sqrt可以直接使用。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Formula&nbsp;formula&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Formula()&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="annotation" style="color:#646464;">@Override</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">public</span>&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">double</span>&nbsp;calculate(<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;a)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;sqrt(a&nbsp;*&nbsp;<span class="number" style="color:#C00000;">100</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">};&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">formula.calculate(<span class="number" style="color:#C00000;">100</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;100.0</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">formula.sqrt(<span class="number" style="color:#C00000;">16</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;4.0</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
formula对象以匿名对象的形式实现了Formula接口。代码很啰嗦：用了6行代码才实现了一个简单的计算功能：a*100开平方根。我们在下一节会看到，Java 8 还有一种更加优美的方法，能够实现包含单个函数的对象。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Lambda表达式<span class="actions"><a name="549" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	让我们从最简单的例子开始，来学习如何对一个string列表进行排序。我们首先使用Java 8之前的方法来实现：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">List&lt;String&gt;&nbsp;names&nbsp;=&nbsp;Arrays.asList(<span class="string" style="color:blue;">"peter"</span>,&nbsp;<span class="string" style="color:blue;">"anna"</span>,&nbsp;<span class="string" style="color:blue;">"mike"</span>,&nbsp;<span class="string" style="color:blue;">"xenia"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Collections.sort(names,&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Comparator&lt;String&gt;()&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="annotation" style="color:#646464;">@Override</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">public</span>&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;compare(String&nbsp;a,&nbsp;String&nbsp;b)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;b.compareTo(a);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">});&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
静态工具方法Collections.sort接受一个list，和一个Comparator接口作为输入参数，Comparator的实现类可以对输入的list中的元素进行比较。通常情况下，你可以直接用创建匿名Comparator对象，并把它作为参数传递给sort方法。&nbsp;<br />
除了创建匿名对象以外，Java 8 还提供了一种更简洁的方式，Lambda表达式。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Collections.sort(names,&nbsp;(String&nbsp;a,&nbsp;String&nbsp;b)&nbsp;-&gt;&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;b.compareTo(a);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">});&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
你可以看到，这段代码就比之前的更加简短和易读。但是，它还可以更加简短：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Collections.sort(names,&nbsp;(String&nbsp;a,&nbsp;String&nbsp;b)&nbsp;-&gt;&nbsp;b.compareTo(a));&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
只要一行代码，包含了方法体。你甚至可以连大括号对{}和return关键字都省略不要。不过这还不是最短的写法：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Collections.sort(names,&nbsp;(a,&nbsp;b)&nbsp;-&gt;&nbsp;b.compareTo(a));&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
Java编译器能够自动识别参数的类型，所以你就可以省略掉类型不写。让我们再深入地研究一下lambda表达式的威力吧。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	函数式接口<span class="actions"><a name="550" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Lambda表达式如何匹配Java的类型系统？每一个lambda都能够通过一个特定的接口，与一个给定的类型进行匹配。一个所谓的函数式接口必须要有且仅有一个抽象方法声明。每个与之对应的lambda表达式必须要与抽象方法的声明相匹配。由于默认方法不是抽象的，因此你可以在你的函数式接口里任意添加默认方法。&nbsp;<br />
任意只包含一个抽象方法的接口，我们都可以用来做成lambda表达式。为了让你定义的接口满足要求，你应当在接口前加上@FunctionalInterface 标注。编译器会注意到这个标注，如果你的接口中定义了第二个抽象方法的话，编译器会抛出异常。&nbsp;<br />
举例：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@FunctionalInterface</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">interface</span>&nbsp;Converter&lt;F,&nbsp;T&gt;&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;T&nbsp;convert(F&nbsp;from);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;String,&nbsp;Integer&gt;&nbsp;converter&nbsp;=&nbsp;(from)&nbsp;-&gt;&nbsp;Integer.valueOf(from);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Integer&nbsp;converted&nbsp;=&nbsp;converter.convert(<span class="string" style="color:blue;">"123"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(converted);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;123</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
注意，如果你不写@FunctionalInterface 标注，程序也是正确的。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	方法和构造函数引用<span class="actions"><a name="551" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	上面的代码实例可以通过静态方法引用，使之更加简洁：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;String,&nbsp;Integer&gt;&nbsp;converter&nbsp;=&nbsp;Integer::valueOf;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Integer&nbsp;converted&nbsp;=&nbsp;converter.convert(<span class="string" style="color:blue;">"123"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(converted);&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;123</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
Java 8 允许你通过::关键字获取方法或者构造函数的的引用。上面的例子就演示了如何引用一个静态方法。而且，我们还可以对一个对象的方法进行引用：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>&nbsp;Something&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;startsWith(String&nbsp;s)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;String.valueOf(s.charAt(<span class="number" style="color:#C00000;">0</span>));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Something&nbsp;something&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Something();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;String,&nbsp;String&gt;&nbsp;converter&nbsp;=&nbsp;something::startsWith;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">String&nbsp;converted&nbsp;=&nbsp;converter.convert(<span class="string" style="color:blue;">"Java"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(converted);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;"J"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
让我们看看如何使用::关键字引用构造函数。首先我们定义一个示例bean，包含不同的构造方法：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>&nbsp;Person&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;firstName;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;lastName;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;Person()&nbsp;{}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;Person(String&nbsp;firstName,&nbsp;String&nbsp;lastName)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">this</span>.firstName&nbsp;=&nbsp;firstName;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">this</span>.lastName&nbsp;=&nbsp;lastName;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
接下来，我们定义一个person工厂接口，用来创建新的person对象：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">interface</span>&nbsp;PersonFactory&lt;P&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">extends</span>&nbsp;Person&gt;&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;P&nbsp;create(String&nbsp;firstName,&nbsp;String&nbsp;lastName);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
然后我们通过构造函数引用来把所有东西拼到一起，而不是像以前一样，通过手动实现一个工厂来这么做。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">PersonFactory&lt;Person&gt;&nbsp;personFactory&nbsp;=&nbsp;Person::<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Person&nbsp;person&nbsp;=&nbsp;personFactory.create(<span class="string" style="color:blue;">"Peter"</span>,&nbsp;<span class="string" style="color:blue;">"Parker"</span>);&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
我们通过Person::new来创建一个Person类构造函数的引用。Java编译器会自动地选择合适的构造函数来匹配PersonFactory.create函数的签名，并选择正确的构造函数形式。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Lambda的范围<span class="actions"><a name="552" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	对于lambdab表达式外部的变量，其访问权限的粒度与匿名对象的方式非常类似。你能够访问局部对应的外部区域的局部final变量，以及成员变量和静态变量。&nbsp;<br />
<strong>访问局部变量</strong>&nbsp;<br />
我们可以访问lambda表达式外部的final局部变量：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">final</span>&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;num&nbsp;=&nbsp;<span class="number" style="color:#C00000;">1</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;Integer,&nbsp;String&gt;&nbsp;stringConverter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(from)&nbsp;-&gt;&nbsp;String.valueOf(from&nbsp;+&nbsp;num);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringConverter.convert(<span class="number" style="color:#C00000;">2</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;3</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
但是与匿名对象不同的是，变量num并不需要一定是final。下面的代码依然是合法的：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;num&nbsp;=&nbsp;<span class="number" style="color:#C00000;">1</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;Integer,&nbsp;String&gt;&nbsp;stringConverter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(from)&nbsp;-&gt;&nbsp;String.valueOf(from&nbsp;+&nbsp;num);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringConverter.convert(<span class="number" style="color:#C00000;">2</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;3</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
然而，num在编译的时候被隐式地当做final变量来处理。下面的代码就不合法：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;num&nbsp;=&nbsp;<span class="number" style="color:#C00000;">1</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Converter&lt;Integer,&nbsp;String&gt;&nbsp;stringConverter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(from)&nbsp;-&gt;&nbsp;String.valueOf(from&nbsp;+&nbsp;num);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">num&nbsp;=&nbsp;<span class="number" style="color:#C00000;">3</span>;&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
在lambda表达式内部企图改变num的值也是不允许的。&nbsp;<br />
<strong>访问成员变量和静态变量</strong>&nbsp;<br />
与局部变量不同，我们在lambda表达式的内部能获取到对成员变量或静态变量的读写权。这种访问行为在匿名对象里是非常典型的。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>&nbsp;Lambda4&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">static</span>&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;outerStaticNum;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;outerNum;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">void</span>&nbsp;testScopes()&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Converter&lt;Integer,&nbsp;String&gt;&nbsp;stringConverter1&nbsp;=&nbsp;(from)&nbsp;-&gt;&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;outerNum&nbsp;=&nbsp;<span class="number" style="color:#C00000;">23</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;String.valueOf(from);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Converter&lt;Integer,&nbsp;String&gt;&nbsp;stringConverter2&nbsp;=&nbsp;(from)&nbsp;-&gt;&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;outerStaticNum&nbsp;=&nbsp;<span class="number" style="color:#C00000;">72</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">return</span>&nbsp;String.valueOf(from);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>访问默认接口方法</strong>&nbsp;<br />
还记得第一节里面formula的那个例子么？ 接口Formula定义了一个默认的方法sqrt，该方法能够访问formula所有的对象实例，包括匿名对象。这个对lambda表达式来讲则无效。&nbsp;<br />
默认方法无法在lambda表达式内部被访问。因此下面的代码是无法通过编译的：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Formula&nbsp;formula&nbsp;=&nbsp;(a)&nbsp;-&gt;&nbsp;sqrt(&nbsp;a&nbsp;*&nbsp;<span class="number" style="color:#C00000;">100</span>);&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	内置函数式接口<span class="actions"><a name="553" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	JDK 1.8 API中包含了很多内置的函数式接口。有些是在以前版本的Java中大家耳熟能详的，例如Comparator接口，或者Runnable接口。对这些现成的接口进行实现，可以通过@FunctionalInterface 标注来启用Lambda功能支持。&nbsp;<br />
此外，Java 8 API 还提供了很多新的函数式接口，来降低程序员的工作负担。有些新的接口已经在<a href="https://code.google.com/p/guava-libraries/" target="_blank">Google Guava</a>库中很有名了。如果你对这些库很熟的话，你甚至闭上眼睛都能够想到，这些接口在类库的实现过程中起了多么大的作用。&nbsp;<br />
<strong>Predicates</strong>&nbsp;<br />
Predicate是一个布尔类型的函数，该函数只有一个输入参数。Predicate接口包含了多种默认方法，用于处理复杂的逻辑动词（and, or，negate）：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Predicate&lt;String&gt;&nbsp;predicate&nbsp;=&nbsp;(s)&nbsp;-&gt;&nbsp;s.length()&nbsp;&gt;&nbsp;<span class="number" style="color:#C00000;">0</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">predicate.test(<span class="string" style="color:blue;">"foo"</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;true</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">predicate.negate().test(<span class="string" style="color:blue;">"foo"</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;false</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Predicate&lt;Boolean&gt;&nbsp;nonNull&nbsp;=&nbsp;Objects::nonNull;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Predicate&lt;Boolean&gt;&nbsp;isNull&nbsp;=&nbsp;Objects::isNull;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Predicate&lt;String&gt;&nbsp;isEmpty&nbsp;=&nbsp;String::isEmpty;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Predicate&lt;String&gt;&nbsp;isNotEmpty&nbsp;=&nbsp;isEmpty.negate();&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Functions</strong>&nbsp;<br />
Function接口接收一个参数，并返回单一的结果。默认方法可以将多个函数串在一起（compse, andThen）：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Function&lt;String,&nbsp;Integer&gt;&nbsp;toInteger&nbsp;=&nbsp;Integer::valueOf;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Function&lt;String,&nbsp;String&gt;&nbsp;backToString&nbsp;=&nbsp;toInteger.andThen(String::valueOf);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">backToString.apply(<span class="string" style="color:blue;">"123"</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;"123"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Suppliers</strong>&nbsp;<br />
Supplier接口产生一个给定类型的结果。与Function不同的是，Supplier没有输入参数。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Supplier&lt;Person&gt;&nbsp;personSupplier&nbsp;=&nbsp;Person::<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">personSupplier.get();&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;new&nbsp;Person</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Consumers</strong>&nbsp;<br />
Consumer代表了在一个输入参数上需要进行的操作。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Consumer&lt;Person&gt;&nbsp;greeter&nbsp;=&nbsp;(p)&nbsp;-&gt;&nbsp;System.out.println(<span class="string" style="color:blue;">"Hello,&nbsp;"</span>&nbsp;+&nbsp;p.firstName);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">greeter.accept(<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Person(<span class="string" style="color:blue;">"Luke"</span>,&nbsp;<span class="string" style="color:blue;">"Skywalker"</span>));&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Comparators</strong>&nbsp;<br />
Comparator接口在早期的Java版本中非常著名。Java 8 为这个接口添加了不同的默认方法。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Comparator&lt;Person&gt;&nbsp;comparator&nbsp;=&nbsp;(p1,&nbsp;p2)&nbsp;-&gt;&nbsp;p1.firstName.compareTo(p2.firstName);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Person&nbsp;p1&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Person(<span class="string" style="color:blue;">"John"</span>,&nbsp;<span class="string" style="color:blue;">"Doe"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Person&nbsp;p2&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;Person(<span class="string" style="color:blue;">"Alice"</span>,&nbsp;<span class="string" style="color:blue;">"Wonderland"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">comparator.compare(p1,&nbsp;p2);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;&gt;&nbsp;0</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">comparator.reversed().compare(p1,&nbsp;p2);&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;&lt;&nbsp;0</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Optionals</strong>&nbsp;<br />
Optional不是一个函数式接口，而是一个精巧的工具接口，用来防止NullPointerEception产生。这个概念在下一节会显得很重要，所以我们在这里快速地浏览一下Optional的工作原理。&nbsp;<br />
Optional是一个简单的值容器，这个值可以是null，也可以是non-null。考虑到一个方法可能会返回一个non-null的值，也可能返回一个空值。为了不直接返回null，我们在Java 8中就返回一个Optional。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Optional&lt;String&gt;&nbsp;optional&nbsp;=&nbsp;Optional.of(<span class="string" style="color:blue;">"bam"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">optional.isPresent();&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;true</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">optional.get();&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;"bam"</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">optional.orElse(<span class="string" style="color:blue;">"fallback"</span>);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;"bam"</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">optional.ifPresent((s)&nbsp;-&gt;&nbsp;System.out.println(s.charAt(<span class="number" style="color:#C00000;">0</span>)));&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;"b"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Streams<span class="actions"><a name="554" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	java.util.Stream表示了某一种元素的序列，在这些元素上可以进行各种操作。Stream操作可以是中间操作，也可以是完结操作。完结操作会返回一个某种类型的值，而中间操作会返回流对象本身，并且你可以通过多次调用同一个流操作方法来将操作结果串起来（就像StringBuffer的append方法一样————译者注）。Stream是在一个源的基础上创建出来的，例如java.util.Collection中的list或者set（map不能作为Stream的源）。Stream操作往往可以通过顺序或者并行两种方式来执行。&nbsp;<br />
我们先了解一下序列流。首先，我们通过string类型的list的形式创建示例数据：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">List&lt;String&gt;&nbsp;stringCollection&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;ArrayList&lt;&gt;();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"ddd2"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"aaa2"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"bbb1"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"aaa1"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"bbb3"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"ccc"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"bbb2"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection.add(<span class="string" style="color:blue;">"ddd1"</span>);&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
Java 8中的Collections类的功能已经有所增强，你可以之直接通过调用Collections.stream()或者Collection.parallelStream()方法来创建一个流对象。下面的章节会解释这个最常用的操作。&nbsp;<br />
<strong>Filter</strong>&nbsp;<br />
Filter接受一个predicate接口类型的变量，并将所有流对象中的元素进行过滤。该操作是一个中间操作，因此它允许我们在返回结果的基础上再进行其他的流操作（forEach）。ForEach接受一个function接口类型的变量，用来执行对每一个元素的操作。ForEach是一个中止操作。它不返回流，所以我们不能再调用其他的流操作。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.filter((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"a"</span>))&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.forEach(System.out::println);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;"aaa2",&nbsp;"aaa1"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Sorted</strong>&nbsp;<br />
Sorted是一个中间操作，能够返回一个排过序的流对象的视图。流对象中的元素会默认按照自然顺序进行排序，除非你自己指定一个Comparator接口来改变排序规则。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.sorted()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.filter((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"a"</span>))&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.forEach(System.out::println);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;"aaa1",&nbsp;"aaa2"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
一定要记住，sorted只是创建一个流对象排序的视图，而不会改变原来集合中元素的顺序。原来string集合中的元素顺序是没有改变的。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(stringCollection);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;ddd2,&nbsp;aaa2,&nbsp;bbb1,&nbsp;aaa1,&nbsp;bbb3,&nbsp;ccc,&nbsp;bbb2,&nbsp;ddd1</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Map</strong>&nbsp;<br />
map是一个对于流对象的中间操作，通过给定的方法，它能够把流对象中的每一个元素对应到另外一个对象上。下面的例子就演示了如何把每个string都转换成大写的string. 不但如此，你还可以把每一种对象映射成为其他类型。对于带泛型结果的流对象，具体的类型还要由传递给map的泛型方法来决定。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.map(String::toUpperCase)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.sorted((a,&nbsp;b)&nbsp;-&gt;&nbsp;b.compareTo(a))&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;.forEach(System.out::println);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;"DDD2",&nbsp;"DDD1",&nbsp;"CCC",&nbsp;"BBB3",&nbsp;"BBB2",&nbsp;"AAA2",&nbsp;"AAA1"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Match</strong>&nbsp;<br />
匹配操作有多种不同的类型，都是用来判断某一种规则是否与流对象相互吻合的。所有的匹配操作都是终结操作，只返回一个boolean类型的结果。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">boolean</span>&nbsp;anyStartsWithA&nbsp;=&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.anyMatch((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"a"</span>));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(anyStartsWithA);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;true</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">boolean</span>&nbsp;allStartsWithA&nbsp;=&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.allMatch((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"a"</span>));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(allStartsWithA);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;false</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">boolean</span>&nbsp;noneStartsWithZ&nbsp;=&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.noneMatch((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"z"</span>));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(noneStartsWithZ);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;true</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Count</strong>&nbsp;<br />
Count是一个终结操作，它的作用是返回一个数值，用来标识当前流对象中包含的元素数量。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;startsWithB&nbsp;=&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.filter((s)&nbsp;-&gt;&nbsp;s.startsWith(<span class="string" style="color:blue;">"b"</span>))&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.count();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(startsWithB);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;3</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Reduce</strong>&nbsp;<br />
该操作是一个终结操作，它能够通过某一个方法，对元素进行削减操作。该操作的结果会放在一个Optional变量里返回。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Optional&lt;String&gt;&nbsp;reduced&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;stringCollection&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.stream()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.sorted()&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.reduce((s1,&nbsp;s2)&nbsp;-&gt;&nbsp;s1&nbsp;+&nbsp;<span class="string" style="color:blue;">"#"</span>&nbsp;+&nbsp;s2);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">reduced.ifPresent(System.out::println);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;"aaa1#aaa2#bbb1#bbb2#bbb3#ccc#ddd1#ddd2"</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Parallel Streams<span class="actions"><a name="555" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	像上面所说的，流操作可以是顺序的，也可以是并行的。顺序操作通过单线程执行，而并行操作则通过多线程执行。&nbsp;<br />
下面的例子就演示了如何使用并行流进行操作来提高运行效率，代码非常简单。&nbsp;<br />
首先我们创建一个大的list，里面的元素都是唯一的：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;max&nbsp;=&nbsp;<span class="number" style="color:#C00000;">1000000</span>;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">List&lt;String&gt;&nbsp;values&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;ArrayList&lt;&gt;(max);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">for</span>&nbsp;(<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;i&nbsp;=&nbsp;<span class="number" style="color:#C00000;">0</span>;&nbsp;i&nbsp;&lt;&nbsp;max;&nbsp;i++)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;UUID&nbsp;uuid&nbsp;=&nbsp;UUID.randomUUID();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;values.add(uuid.toString());&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
现在，我们测量一下对这个集合进行排序所使用的时间。&nbsp;<br />
<strong>顺序排序</strong>&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;t0&nbsp;=&nbsp;System.nanoTime();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;count&nbsp;=&nbsp;values.stream().sorted().count();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(count);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;t1&nbsp;=&nbsp;System.nanoTime();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;millis&nbsp;=&nbsp;TimeUnit.NANOSECONDS.toMillis(t1&nbsp;-&nbsp;t0);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(String.format(<span class="string" style="color:blue;">"sequential&nbsp;sort&nbsp;took:&nbsp;%d&nbsp;ms"</span>,&nbsp;millis));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;sequential&nbsp;sort&nbsp;took:&nbsp;899&nbsp;ms</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>并行排序</strong>&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;t0&nbsp;=&nbsp;System.nanoTime();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;count&nbsp;=&nbsp;values.parallelStream().sorted().count();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(count);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;t1&nbsp;=&nbsp;System.nanoTime();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;millis&nbsp;=&nbsp;TimeUnit.NANOSECONDS.toMillis(t1&nbsp;-&nbsp;t0);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(String.format(<span class="string" style="color:blue;">"parallel&nbsp;sort&nbsp;took:&nbsp;%d&nbsp;ms"</span>,&nbsp;millis));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;parallel&nbsp;sort&nbsp;took:&nbsp;472&nbsp;ms</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
如你所见，所有的代码段几乎都相同，唯一的不同就是把stream()改成了parallelStream(), 结果并行排序快了50%。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Map<span class="actions"><a name="556" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	正如前面已经提到的那样，map是不支持流操作的。而更新后的map现在则支持多种实用的新方法，来完成常规的任务。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Map&lt;Integer,&nbsp;String&gt;&nbsp;map&nbsp;=&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">new</span>&nbsp;HashMap&lt;&gt;();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">for</span>&nbsp;(<span class="keyword" style="color:#7F0055;font-weight:bold;">int</span>&nbsp;i&nbsp;=&nbsp;<span class="number" style="color:#C00000;">0</span>;&nbsp;i&nbsp;&lt;&nbsp;<span class="number" style="color:#C00000;">10</span>;&nbsp;i++)&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;map.putIfAbsent(i,&nbsp;<span class="string" style="color:blue;">"val"</span>&nbsp;+&nbsp;i);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.forEach((id,&nbsp;val)&nbsp;-&gt;&nbsp;System.out.println(val));&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
上面的代码风格是完全自解释的：putIfAbsent避免我们将null写入；forEach接受一个消费者对象，从而将操作实施到每一个map中的值上。&nbsp;<br />
下面的这个例子展示了如何使用函数来计算map的编码：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.computeIfPresent(<span class="number" style="color:#C00000;">3</span>,&nbsp;(num,&nbsp;val)&nbsp;-&gt;&nbsp;val&nbsp;+&nbsp;num);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">3</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;val33</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.computeIfPresent(<span class="number" style="color:#C00000;">9</span>,&nbsp;(num,&nbsp;val)&nbsp;-&gt;&nbsp;<span class="keyword" style="color:#7F0055;font-weight:bold;">null</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.containsKey(<span class="number" style="color:#C00000;">9</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;false</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.computeIfAbsent(<span class="number" style="color:#C00000;">23</span>,&nbsp;num&nbsp;-&gt;&nbsp;<span class="string" style="color:blue;">"val"</span>&nbsp;+&nbsp;num);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.containsKey(<span class="number" style="color:#C00000;">23</span>);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;true</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.computeIfAbsent(<span class="number" style="color:#C00000;">3</span>,&nbsp;num&nbsp;-&gt;&nbsp;<span class="string" style="color:blue;">"bam"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">3</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;val33</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
接下来，我们将学习，当给定一个key值时，如何把一个实例从对应的key中移除：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.remove(<span class="number" style="color:#C00000;">3</span>,&nbsp;<span class="string" style="color:blue;">"val3"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">3</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;val33</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.remove(<span class="number" style="color:#C00000;">3</span>,&nbsp;<span class="string" style="color:blue;">"val33"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">3</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;null</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
另一个有用的方法：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.getOrDefault(<span class="number" style="color:#C00000;">42</span>,&nbsp;<span class="string" style="color:blue;">"not&nbsp;found"</span>);&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;not&nbsp;found</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
将map中的实例合并也是非常容易的：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.merge(<span class="number" style="color:#C00000;">9</span>,&nbsp;<span class="string" style="color:blue;">"val9"</span>,&nbsp;(value,&nbsp;newValue)&nbsp;-&gt;&nbsp;value.concat(newValue));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">9</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;val9</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.merge(<span class="number" style="color:#C00000;">9</span>,&nbsp;<span class="string" style="color:blue;">"concat"</span>,&nbsp;(value,&nbsp;newValue)&nbsp;-&gt;&nbsp;value.concat(newValue));&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">map.get(<span class="number" style="color:#C00000;">9</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;val9concat</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
合并操作先看map中是否没有特定的key/value存在，如果是，则把key/value存入map，否则merging函数就会被调用，对现有的数值进行修改。&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	时间日期API<span class="actions"><a name="557" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Java 8 包含了全新的时间日期API，这些功能都放在了java.time包下。新的时间日期API是基于Joda-Time库开发的，但是也不尽相同。下面的例子就涵盖了大多数新的API的重要部分。&nbsp;<br />
<strong>Clock</strong>&nbsp;<br />
Clock提供了对当前时间和日期的访问功能。Clock是对当前时区敏感的，并可用于替代System.currentTimeMillis()方法来获取当前的毫秒时间。当前时间线上的时刻可以用Instance类来表示。Instance也能够用于创建原先的java.util.Date对象。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Clock&nbsp;clock&nbsp;=&nbsp;Clock.systemDefaultZone();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;millis&nbsp;=&nbsp;clock.millis();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Instant&nbsp;instant&nbsp;=&nbsp;clock.instant();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Date&nbsp;legacyDate&nbsp;=&nbsp;Date.from(instant);&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;legacy&nbsp;java.util.Date</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>Timezones</strong>&nbsp;<br />
时区类可以用一个ZoneId来表示。时区类的对象可以通过静态工厂方法方便地获取。时区类还定义了一个偏移量，用来在当前时刻或某时间与目标时区时间之间进行转换。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(ZoneId.getAvailableZoneIds());&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;prints&nbsp;all&nbsp;available&nbsp;timezone&nbsp;ids</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">ZoneId&nbsp;zone1&nbsp;=&nbsp;ZoneId.of(<span class="string" style="color:blue;">"Europe/Berlin"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">ZoneId&nbsp;zone2&nbsp;=&nbsp;ZoneId.of(<span class="string" style="color:blue;">"Brazil/East"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(zone1.getRules());&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(zone2.getRules());&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;ZoneRules[currentStandardOffset=+01:00]</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="comment" style="color:#008200;">//&nbsp;ZoneRules[currentStandardOffset=-03:00]</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>LocalTime</strong>&nbsp;<br />
本地时间类表示一个没有指定时区的时间，例如，10 p.m.或者17：30:15，下面的例子会用上面的例子定义的时区创建两个本地时间对象。然后我们会比较两个时间，并计算它们之间的小时和分钟的不同。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalTime&nbsp;now1&nbsp;=&nbsp;LocalTime.now(zone1);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalTime&nbsp;now2&nbsp;=&nbsp;LocalTime.now(zone2);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(now1.isBefore(now2));&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;false</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;hoursBetween&nbsp;=&nbsp;ChronoUnit.HOURS.between(now1,&nbsp;now2);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;minutesBetween&nbsp;=&nbsp;ChronoUnit.MINUTES.between(now1,&nbsp;now2);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(hoursBetween);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;-3</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(minutesBetween);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;-239</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
LocalTime是由多个工厂方法组成，其目的是为了简化对时间对象实例的创建和操作，包括对时间字符串进行解析的操作。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalTime&nbsp;late&nbsp;=&nbsp;LocalTime.of(<span class="number" style="color:#C00000;">23</span>,&nbsp;<span class="number" style="color:#C00000;">59</span>,&nbsp;<span class="number" style="color:#C00000;">59</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(late);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;23:59:59</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">DateTimeFormatter&nbsp;germanFormatter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;DateTimeFormatter&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.ofLocalizedTime(FormatStyle.SHORT)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.withLocale(Locale.GERMAN);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalTime&nbsp;leetTime&nbsp;=&nbsp;LocalTime.parse(<span class="string" style="color:blue;">"13:37"</span>,&nbsp;germanFormatter);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(leetTime);&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;13:37</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>LocalDate</strong>&nbsp;<br />
本地时间表示了一个独一无二的时间，例如：2014-03-11。这个时间是不可变的，与LocalTime是同源的。下面的例子演示了如何通过加减日，月，年等指标来计算新的日期。记住，每一次操作都会返回一个新的时间对象。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDate&nbsp;today&nbsp;=&nbsp;LocalDate.now();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDate&nbsp;tomorrow&nbsp;=&nbsp;today.plus(<span class="number" style="color:#C00000;">1</span>,&nbsp;ChronoUnit.DAYS);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDate&nbsp;yesterday&nbsp;=&nbsp;tomorrow.minusDays(<span class="number" style="color:#C00000;">2</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDate&nbsp;independenceDay&nbsp;=&nbsp;LocalDate.of(<span class="number" style="color:#C00000;">2014</span>,&nbsp;Month.JULY,&nbsp;<span class="number" style="color:#C00000;">4</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">DayOfWeek&nbsp;dayOfWeek&nbsp;=&nbsp;independenceDay.getDayOfWeek();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(dayOfWeek);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;FRIDAY&lt;span&nbsp;style="font-family:&nbsp;Georgia,&nbsp;'Times&nbsp;New&nbsp;Roman',&nbsp;'Bitstream&nbsp;Charter',&nbsp;Times,&nbsp;serif;&nbsp;font-size:&nbsp;13px;&nbsp;line-height:&nbsp;19px;"&gt;Parsing&nbsp;a&nbsp;LocalDate&nbsp;from&nbsp;a&nbsp;string&nbsp;is&nbsp;just&nbsp;as&nbsp;simple&nbsp;as&nbsp;parsing&nbsp;a&nbsp;LocalTime:&lt;/span&gt;</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
解析字符串并形成LocalDate对象，这个操作和解析LocalTime一样简单。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">DateTimeFormatter&nbsp;germanFormatter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;DateTimeFormatter&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.ofLocalizedDate(FormatStyle.MEDIUM)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.withLocale(Locale.GERMAN);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDate&nbsp;xmas&nbsp;=&nbsp;LocalDate.parse(<span class="string" style="color:blue;">"24.12.2014"</span>,&nbsp;germanFormatter);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(xmas);&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;2014-12-24</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
<strong>LocalDateTime</strong>&nbsp;<br />
LocalDateTime表示的是日期-时间。它将刚才介绍的日期对象和时间对象结合起来，形成了一个对象实例。LocalDateTime是不可变的，与LocalTime和LocalDate的工作原理相同。我们可以通过调用方法来获取日期时间对象中特定的数据域。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDateTime&nbsp;sylvester&nbsp;=&nbsp;LocalDateTime.of(<span class="number" style="color:#C00000;">2014</span>,&nbsp;Month.DECEMBER,&nbsp;<span class="number" style="color:#C00000;">31</span>,&nbsp;<span class="number" style="color:#C00000;">23</span>,&nbsp;<span class="number" style="color:#C00000;">59</span>,&nbsp;<span class="number" style="color:#C00000;">59</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">DayOfWeek&nbsp;dayOfWeek&nbsp;=&nbsp;sylvester.getDayOfWeek();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(dayOfWeek);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;WEDNESDAY</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Month&nbsp;month&nbsp;=&nbsp;sylvester.getMonth();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(month);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;DECEMBER</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">long</span>&nbsp;minuteOfDay&nbsp;=&nbsp;sylvester.getLong(ChronoField.MINUTE_OF_DAY);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(minuteOfDay);&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;1439</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
如果再加上的时区信息，LocalDateTime能够被转换成Instance实例。Instance能够被转换成以前的java.util.Date对象。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Instant&nbsp;instant&nbsp;=&nbsp;sylvester&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.atZone(ZoneId.systemDefault())&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.toInstant();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Date&nbsp;legacyDate&nbsp;=&nbsp;Date.from(instant);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(legacyDate);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;Wed&nbsp;Dec&nbsp;31&nbsp;23:59:59&nbsp;CET&nbsp;2014</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
格式化日期-时间对象就和格式化日期对象或者时间对象一样。除了使用预定义的格式以外，我们还可以创建自定义的格式化对象，然后匹配我们自定义的格式。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">DateTimeFormatter&nbsp;formatter&nbsp;=&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;DateTimeFormatter&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.ofPattern(<span class="string" style="color:blue;">"MMM&nbsp;dd,&nbsp;yyyy&nbsp;-&nbsp;HH:mm"</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">LocalDateTime&nbsp;parsed&nbsp;=&nbsp;LocalDateTime.parse(<span class="string" style="color:blue;">"Nov&nbsp;03,&nbsp;2014&nbsp;-&nbsp;07:13"</span>,&nbsp;formatter);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">String&nbsp;string&nbsp;=&nbsp;formatter.format(parsed);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(string);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;Nov&nbsp;03,&nbsp;2014&nbsp;-&nbsp;07:13</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
不同于java.text.NumberFormat，新的DateTimeFormatter类是不可变的，也是线程安全的。&nbsp;<br />
更多的细节，请看<a href="http://download.java.net/jdk8/docs/api/java/time/format/DateTimeFormatter.html" target="_blank">这里</a>&nbsp;<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Annotations<span class="actions"><a name="558" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Java 8中的注解是可重复的。让我们直接深入看看例子，弄明白它是什么意思。&nbsp;<br />
首先，我们定义一个包装注解，它包括了一个实际注解的数组&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">@interface</span>&nbsp;Hints&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;Hint[]&nbsp;value();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@Repeatable</span>(Hints.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">@interface</span>&nbsp;Hint&nbsp;{&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;value();&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
只要在前面加上注解名：@Repeatable，Java 8 允许我们对同一类型使用多重注解：&nbsp;<br />
变体1：使用注解容器（老方法）：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@Hints</span>({<span class="annotation" style="color:#646464;">@Hint</span>(<span class="string" style="color:blue;">"hint1"</span>),&nbsp;<span class="annotation" style="color:#646464;">@Hint</span>(<span class="string" style="color:blue;">"hint2"</span>)})&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>&nbsp;Person&nbsp;{}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
变体2：使用可重复注解（新方法）：&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@Hint</span>(<span class="string" style="color:blue;">"hint1"</span>)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@Hint</span>(<span class="string" style="color:blue;">"hint2"</span>)&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>&nbsp;Person&nbsp;{}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
使用变体2，Java编译器能够在内部自动对@Hint进行设置。这对于通过反射来读取注解信息来说，是非常重要的。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Hint&nbsp;hint&nbsp;=&nbsp;Person.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>.getAnnotation(Hint.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(hint);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;null</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Hints&nbsp;hints1&nbsp;=&nbsp;Person.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>.getAnnotation(Hints.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(hints1.value().length);&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;2</span>&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">&nbsp;&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">Hint[]&nbsp;hints2&nbsp;=&nbsp;Person.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>.getAnnotationsByType(Hint.<span class="keyword" style="color:#7F0055;font-weight:bold;">class</span>);&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;">System.out.println(hints2.length);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment" style="color:#008200;">//&nbsp;2</span>&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
尽管我们绝对不会在Person类上声明@Hints注解，但是它的信息仍然可以通过getAnnotation(Hints.class)来读取。并且，getAnnotationsByType方法会更方便，因为它赋予了所有@Hints注解标注的方法直接的访问权限。&nbsp;<br />
	<div class="dp-highlighter" style="font-family:Monaco, 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Consolas, 'Courier New', monospace;font-size:12px;background-color:transparent;margin-left:9px;padding:1px;">
		<div class="bar">
			<div class="tools" style="padding:3px;margin:0px;font-weight:bold;">
				Java代码&nbsp;
			</div>
		</div>
		<ol class="dp-j" style="font-size:1em;color:#2B91AF;">
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="annotation" style="color:#646464;">@Target</span>({ElementType.TYPE_PARAMETER,&nbsp;ElementType.TYPE_USE})&nbsp;&nbsp;</span> 
			</li>
			<li style="font-size:1em;background-color:#FAFAFA;">
				<span style="color:black;"><span class="keyword" style="color:#7F0055;font-weight:bold;">@interface</span>&nbsp;MyAnnotation&nbsp;{}&nbsp;&nbsp;</span> 
			</li>
		</ol>
	</div>
<br />
</div>
<h2 style="font-size:16px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	总结<span class="actions"><a name="559" href="http://www.iteye.com/magazines/129-Java-8-Tutorial#top"><img alt="Top" src="http://www.iteye.com/images/wiki/top.gif?1324994303" /></a></span> 
</h2>
<div class="news_content" style="padding:5px 8px;font-size:14px;font-family:Helvetica, Tahoma, Arial, sans-serif;background-color:#FFFFFF;">
	Java 8编程指南就到此告一段落。当然，还有很多内容需要进一步研究和说明。这就需要靠读者您来对JDK 8进行探究了，例如：Arrays.parallelSort, StampedLock和CompletableFuture等等 ———— 我这里只是举几个例子而已。&nbsp;<br />
我希望这个博文能够对您有所帮助，也希望您阅读愉快。完整的教程源代码放在了<a href="https://github.com/winterbe/java8-tutorial" target="_blank">GitHub</a>上。您可以尽情地<a href="https://github.com/winterbe/java8-tutorial/fork" target="_blank">fork</a>，并请通过<a href="https://twitter.com/benontherun" target="_blank">Twitter</a>告诉我您的反馈。&nbsp;<br />
原文链接：&nbsp;<a href="http://winterbe.com/posts/2014/03/16/java-8-tutorial/" target="_blank">winterbe</a>&nbsp;翻译：&nbsp;<a href="http://www.importnew.com/" target="_blank">ImportNew.com&nbsp;</a>-&nbsp;<a href="http://www.importnew.com/author/huangxiaofei" target="_blank">黄小非</a>&nbsp;<br />
译文链接：&nbsp;<a href="http://www.importnew.com/10360.html" target="_blank">http://www.importnew.com/10360.html</a> 
</div>