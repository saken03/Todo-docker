\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{hyperref}

\title{Project: Automated Deployment Pipeline for a React-based Todo App}
\author{}
\date{}

\begin{document}

\maketitle

\section*{Overview}
This project aims to design and implement a robust deployment pipeline for a React-based todo web application. Utilizing Bash scripting and Docker, the pipeline automates the deployment process, ensuring it is efficient, reproducible, and scalable.

\section*{Components}
The project consists of several key components:

\subsection*{Scripts}
\begin{itemize}
    \item \textbf{setup.sh}
    \begin{itemize}
        \item \textbf{Purpose}: Initializes and runs the Docker environment using \texttt{docker-compose.yml}.
        \item \textbf{Commands}:
        \begin{itemize}
            \item \texttt{docker-compose up}: Starts the Docker Compose file's configured containers in detached mode.
        \end{itemize}
    \end{itemize}

    \item \textbf{manage\_logs.sh}
    \begin{itemize}
        \item \textbf{Purpose}: Manages log files by creating a dedicated folder and consolidating logs into it.
        \item \textbf{Commands}:
        \begin{itemize}
            \item \texttt{mkdir -p /var/logs/docker-logs}: Ensures a directory exists for storing Docker logs.
            \item \texttt{cp /var/lib/docker/containers/*/*.log /var/logs/docker-logs}: Copies Docker container logs to the specified directory.
        \end{itemize}
    \end{itemize}

    \item \textbf{cleanup\_docker.sh}
    \begin{itemize}
        \item \textbf{Purpose}: Cleans up the Docker environment by stopping and removing unnecessary containers, images, networks, and volumes.
        \item \textbf{Commands}:
        \begin{itemize}
            \item \texttt{docker stop \$(docker ps -aq)}: Stops all Docker containers.
            \item \texttt{docker rm \$(docker ps -aq)}: Removes all stopped containers.
            \item \texttt{docker network prune -f}: Removes unused Docker networks.
            \item \texttt{docker image prune -f}: Removes dangling Docker images.
            \item \texttt{docker volume prune -f}: Removes unused Docker volumes.
        \end{itemize}
    \end{itemize}

    \item \textbf{monitor\_resources.sh}
    \begin{itemize}
        \item \textbf{Purpose}: Monitors resource usage of Docker containers.
        \item \textbf{Commands}:
        \begin{itemize}
            \item \texttt{docker stats --no-stream}: Displays current Docker container resource usage.
        \end{itemize}
    \end{itemize}
\end{itemize}

\subsection*{Dockerization}
\begin{itemize}
    \item \textbf{docker-compose.yml}: Specifies all necessary components such as volumes, networks, and services for the Docker containers.
    \item \textbf{Dockerfile}: Automates the building of Docker images by specifying the base image, commands, and configuration necessary for the application.
\end{itemize}

\section*{Deployment}
The Continuous Integration (CI) and Deployment pipeline is set up using GitHub Actions. This CI/CD pipeline is configured to trigger on every push to the main branch, automating the build and deployment processes on a GitHub-hosted Ubuntu runner. Integration with Google Cloud Platform (GCP) is accomplished through a service account, facilitating secure interactions with GCP services like Artifact Registry for storing Docker images and build artifacts.

\section*{Getting Started}
To get started with this project:

\begin{enumerate}
    \item \textbf{Clone the Repository}
    \begin{verbatim}
    git clone https://github.com/your-repository/todo-app.git
    cd todo-app
    \end{verbatim}

    \item \textbf{Run Setup Script}
    \begin{verbatim}
    ./setup.sh
    \end{verbatim}

    \item \textbf{Deploy}
    \begin{itemize}
        \item Ensure GCP configurations are set as described in the documentation.
        \item Trigger a push to the main branch or manually execute the GitHub Actions workflow.
    \end{itemize}
\end{enumerate}

\section*{Conclusion}
This project demonstrates the effective application of Dockerization and Bash scripting in creating an optimized CI pipeline. By ensuring consistent environments across deployment phases and automating routine tasks, the project achieves high reliability and scalability, providing a solid foundation for future enhancements.

\end{document}
