<?php
	require_once("includes/global.inc.php");
	$obj = new TAjaxtable();
   
	if(isset($_POST) && count($_POST)){
		$action = $_POST['action'];
		unset($_POST['action']);
		if($action == "save"){		
			$escapedPost = array_map('mysql_real_escape_string', $_POST);
			$escapedPost = array_map('htmlentities', $escapedPost);
			
			$res = $obj->save($escapedPost);
			
			if($res){
				$escapedPost["success"] = "1";
				$escapedPost["id"] = $res;
				echo json_encode($escapedPost);
			}
			else
				echo $obj->error("save");
		}else if($action == "del"){
			$id = $_POST['rid'];
			$res = $obj->delete_record($id);
			if($res)
				echo json_encode(array("success" => "1","id" => $id));	
			else
				echo $obj->error("delete");
		}
		else if($action == "update"){
			
			$escapedPost = array_map('mysql_real_escape_string', $_POST);
			$escapedPost = array_map('htmlentities', $escapedPost);

			$id = $obj->update_record($escapedPost);
			if($id)
				echo json_encode(array_merge(array("success" => "1","id" => $id),$escapedPost));	
			else
				echo $obj->error("update");
		}
		else if($action == "updatetd"){
			
			$escapedPost = array_map('mysql_real_escape_string', $_POST);
			$escapedPost = array_map('htmlentities', $escapedPost);

			$id = $obj->update_column($escapedPost);
			if($id)
				echo json_encode(array_merge(array("success" => "1","id" => $id),$escapedPost));	
			else
				echo $obj->error("updatetd");
		}
	}
?>