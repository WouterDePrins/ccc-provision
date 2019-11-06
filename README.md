# ccc-provision

This repository contains the source code & model of a simple 3-tier Cisco Cloudcenter Suite deployment that I've created. The README.md also explains all the steps I took to get to this solution.

## tl;dr

If you just want to deploy this application yourself, set up your cloud(s) by going to admin --> clouds in the workload manager. Next, download the [threetier.zip](threetier.zip) file, go to "App profiles" and import it by clicking IMPORT.

Finally, you can go to Deployments --> new deployment and follow the GUI. When your application is in the "deployed" state, you can "access application" and start using it.

## Modeling an application

### Getting started

To start modeling application in Cloudcenter, you can go to App profiles --> Model. I always select N-Tier application because it gives you the most flexibility.

Let's start by providing some settings by going to the Basic Information tab. We'll fill in the name and version. You can specify some extra information like description, logo and protocol but we'll leave those on default this for this project.

Now that our required settings have been set, we can go into the Topology Modeler tab and start modeling our application.

### Choose your granularity

For most applications like frontend, middleware, backend and database, I like using the basic OS service instead of the other, more specific, images. The service-specific images often have outdated software versions so you'll have to provide scripts to update them anyways. Why not just do a clean install?

CloudCenter offers a drag-and-drop interface so you'll find it easy to create multi-tier applications. All icons that you drag into the model represent a tier; so no need to drag multiple webservers into there to create a load balanced environment.

### Database

I like to start with the lowest tier and build up applications as we go. Since our database is the lowest tier, we can start with this one. I chose to host MySQL on CentOS 7.x so we'll start by dragging the OS service CentOS into our modeler. We'll change the name to "Database" and since we don't want to load balance traffic to our database (because replication in MySQL is a pain in the ass ;) ), we'll limit the maximum number of nodes to 1.

![image of Properties](img/prop.png =250x)

The External Initialization section allows us to execute scripts at different stages of our deployment. I like to specify my startup config under Node Initialization & Clean Up so we'll skip this section for now. Our security policies are set in the Firewall Rules section. You can go as specific as you want here. For the purpose of this demo, I'll allow access to port 3306 from every network (0.0.0.0/0).

In the Node Initialization & Clean Up tab, we can setup our Initialization script. For installing MySQL on CentOS 7, I created a [script](mysql.sh) that we'll call in the Initialization script field by selecting URL or Command and pasting "bash <(curl -s https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh)" in the text field. This will get the mysql.sh file from github (curl) and execute it (bash).

There is one last, very important, step that we have to take. Cloudcenter secures it's VM's in a way that sudo commands have to be whitelisted. We'll just take all the commands that we used in [mysql.sh](mysql.sh) and paste them in there. This would look something like "yum;rpm;systemctl;echo;mkdir;tee;grep".

We'll leave the rest of the sections at there default values.

### Web

### Loadbalancer