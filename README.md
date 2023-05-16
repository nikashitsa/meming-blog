# Meming Blog
[Meming Bot](https://t.me/memingbot) official site.

#### Development
```
bundle exec jekyll s
docker-compose up -d
open http://localhost/
```

#### Deploy
```
JEKYLL_ENV=production bundle exec jekyll build
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
```
