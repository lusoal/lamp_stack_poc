from locust import HttpLocust, TaskSet, task


# GET https://wordpress.lucasduarte.club/
# GET https://wordpress.lucasduarte.club/2020/01/07/teste/
# GET https://wordpress.lucasduarte.club/2020/01/
# GET https://wordpress.lucasduarte.club/category/uncategorized/
# GET https://wordpress.lucasduarte.club/wp-login.php

class UserBehavior(TaskSet):
    def on_start(self):
        """ on_start is called when a Locust start before any task is scheduled """
    
    @task(1) # Do not necessary need of the pipeline, just to orchestrate better
    def user_pipeline(self):
        self.index()
        self.get_categories()
        self.get_specific_post()
        self.get_wp_login()
    
    # Simulacao de Gets

    def index(self):
        self.client.get("/")
    
    def get_specific_post(self):
        self.client.get("/2020/01/07/teste/")
    
    def get_categories(self):
        self.client.get("/2020/01/02/hello-world/")

    def get_wp_login(self):
        self.client.get("/wp-login.php")

    # TODO: Criar fluxo de escrita de um novo post

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 9000
