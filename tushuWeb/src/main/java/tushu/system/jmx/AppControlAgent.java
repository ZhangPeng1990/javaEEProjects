package tushu.system.jmx;


import java.io.IOException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import javax.management.InstanceAlreadyExistsException;
import javax.management.MBeanRegistrationException;
import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;
import javax.management.remote.JMXConnectorServer;
import javax.management.remote.JMXConnectorServerFactory;
import javax.management.remote.JMXServiceURL;

import com.sun.jdmk.comm.HtmlAdaptorServer;

public class AppControlAgent {

	public static void main(String[] args) throws MalformedObjectNameException,  
	    NullPointerException, InstanceAlreadyExistsException,  
	    MBeanRegistrationException, NotCompliantMBeanException, IOException {  
	
		int rmiPort = 1099;  
		String jmxServerName = "AppControlJMXServer";  
		  
		Registry registry = LocateRegistry.createRegistry(rmiPort);  
		
		MBeanServer mbs = MBeanServerFactory.createMBeanServer(jmxServerName);  
		
		HtmlAdaptorServer adapter = new HtmlAdaptorServer();  
		ObjectName adapterName;  
		adapterName = new ObjectName(jmxServerName + ":name=" + "htmladapter");  
		adapter.setPort(8082);  
		adapter.start();  
		mbs.registerMBean(adapter, adapterName);  
		
		ObjectName objName = new ObjectName(jmxServerName + ":name=" + "AppControl");  
		mbs.registerMBean(new AppControl(), objName);  
		  
		
		JMXServiceURL url = new JMXServiceURL("service:jmx:rmi:///jndi/rmi://localhost:" + rmiPort + "/" + jmxServerName);  
		System.out.println("JMXServiceURL: " + url.toString());  
		JMXConnectorServer jmxConnServer = JMXConnectorServerFactory.newJMXConnectorServer(url, null, mbs);  
		jmxConnServer.start();  
	
	}  
	
}
