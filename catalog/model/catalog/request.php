<?php
class ModelCatalogRequest extends Model {
	public function getImage(){
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "upload`");

		return $query->rows;
	}
}