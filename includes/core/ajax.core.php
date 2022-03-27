<?php

class TAjaxtable {

  function save($data){
	if(count($data)){
		$values = implode("','", array_values($data));
		
		if(1) return time();
		return 0;
	}
	else return 0;	
  }	

  function delete_record($id){
	 if($id){
		return 1;
	 }
  }	

  function update_record($data){
	if(count($data)){
		$id = $data['rid'];
		unset($data['rid']);
		$values = implode("','", array_values($data));
		$str = "";
		foreach($data as $key=>$val){
			$str .= $key."='".$val."',";
		}
		$str = substr($str,0,-1);
		
		if(1) return $id;
		return 0;
	}
	else return 0;	
  }	

  function update_column($data){
	if(count($data)){
		$id = $data['rid'];
		unset($data['rid']);
		if(1) return $id;
		return 0;
		
	}	
  }

  function error($act){
	 return json_encode(array("success" => "0","action" => $act));
  }

}

?>