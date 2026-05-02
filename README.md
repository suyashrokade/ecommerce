# Ecommerce Web Application

This is a simple Java ecommerce web application built as a Maven WAR project.

## Project structure

- `pom.xml` - Maven configuration
- `src/main/java` - Servlet and model classes
- `src/main/webapp` - JSP pages and web.xml
- `Jenkinsfile` - Jenkins pipeline definition

## How to use

1. Build locally:
   ```bash
   mvn clean package
   ```
2. Deploy on Apache Tomcat:
   - Copy `target/ecommerce.war` to `TOMCAT_HOME/webapps`
   - Or use the Jenkins pipeline with Tomcat manager credentials

## Jenkins pipeline

The included `Jenkinsfile` has three stages:
- `Checkout`
- `Build`
- `Deploy`

Create a Jenkins credential with ID `tomcat-manager` and type `Username with password`, then use it in the pipeline.

## GitHub

To push this project to GitHub:

```bash
git init
git add .
git commit -m "Add ecommerce webapp project"
git remote add origin <your-github-repo-url>
git push -u origin main
```
