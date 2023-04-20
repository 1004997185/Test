		var switch1 = document.getElementById("switch1");
		switch1.onclick=function(){		
			var admin = document.getElementById("admin");
			var stu = document.getElementById("stu");
			stu.style.display="none";
			admin.style.display="block";
		}
		var switch2 = document.getElementById("switch2");
		switch2.onclick=function(){		
			var admin = document.getElementById("admin");
			var stu = document.getElementById("stu");
			admin.style.display="none";
			stu.style.display="block";
		}		