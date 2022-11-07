package com.hp.plant.model.controller;

import java.util.ArrayList;
import java.util.List;

import com.hp.plant.api.PlantOpenApi;
import com.hp.plant.model.service.PlantService;
import com.hp.plant.model.vo.PlantInfo;

public class PlantController {
	PlantService plantService = new PlantService();

	public List<PlantInfo> initPlant() {
		List<PlantInfo> list = new ArrayList<>();
		for (int i = 1; i < 33; i++) {
			PlantInfo plant = PlantOpenApi.detailInfo(i);
			System.out.println(plant.toString());
			list.add(plant);
		}
		plantService.insertAll(list);
		
		return list;
	}
	
	public static void main(String[] args) {
		PlantController controller = new PlantController();
		controller.initPlant();
	}

}
