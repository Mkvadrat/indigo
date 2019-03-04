<?php
class ModelToolUpload extends Model {
	public function addUpload($name, $filename) {
		$code = sha1(uniqid(mt_rand(), true));

		$this->db->query("INSERT INTO `" . DB_PREFIX . "upload` SET `name` = '" . $this->db->escape($name) . "', `filename` = '" . $this->db->escape($filename) . "', `code` = '" . $this->db->escape($code) . "', `date_added` = NOW()");

		return $code;
	}

	public function getUploadByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "upload` WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}
	
	public function removeFile($filename){
		$query = $this->db->query("DELETE FROM " . DB_PREFIX . "upload WHERE filename = '" . $filename . "'");
	}
	
	public function removeAll(){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "upload`");

		foreach($query->rows as $name){
			if(file_exists(DIR_UPLOAD . $name['filename'])){
				unlink(DIR_UPLOAD . $name['filename']);
			}
		}
	
		$query = $this->db->query("DELETE FROM " . DB_PREFIX . "upload");
	}
	
	public function getImage(){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "upload`");

		return $query->rows;
	}
	
	public function getImageByName($name){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "upload` WHERE name = '" . $name . "'");

		return $query->rows;
	}
}