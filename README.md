# Job Board Application

A comprehensive web platform built with Ruby on Rails that connects job seekers with recruiters. The application features user authentication, job listings, job applications, and dashboards for both recruiters and job seekers.

## Technology Stack

* Ruby 2.6.3
* Rails 6.0
* PostgreSQL database
* Bootstrap 4.5 for UI components
* Devise for authentication

## Core Features

### Authentication
* Two user types: JobSeeker and Recruiter
* Secure registration and login with Devise
* Email notifications for new registrations

### Job Management
* Recruiters can create, edit, and delete job listings
* Job listings include title, description, requirements, location, and salary
* Job seekers can browse and search for jobs
* Job seekers can apply for jobs with a single click

### Dashboard Interface
* Recruiters: View posted jobs and track applications
* Job Seekers: Track job applications and browse new opportunities
* Profile management for both user types

### Search Functionality
* Text-based search for jobs by title
* Company search by name and location

## Getting Started

### Prerequisites
* Ruby 2.6.3
* Rails 6.0
* PostgreSQL

### Installation

1. Clone the repository
2. Install dependencies:
   ```
   bundle install
   ```
3. Set up the database:
   ```
   rails db:create
   rails db:migrate
   ```
4. Start the server:
   ```
   rails server
   ```