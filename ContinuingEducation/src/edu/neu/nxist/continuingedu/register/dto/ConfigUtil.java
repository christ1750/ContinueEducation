package edu.neu.nxist.continuingedu.register.dto;

import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
public class ConfigUtil {
	/**
	 * @return configuration of Notification.properties
	 */
	public static CompositeConfiguration getConfig() {
		CompositeConfiguration config = new CompositeConfiguration(); 
		try {
			config.addConfiguration(new PropertiesConfiguration("notification.properties"));
		} catch (ConfigurationException e) {
			e.getMessage();
		}
		return config;
	}
}
