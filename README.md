# base-express

Starter boilerplate

## Getting started

```text
npm i

# creates .db file with the name in .env of the type in schema.prisma
npx prisma migrate dev --name init

cp env.template .env

npm run dev
```

## Docker

```text
# Create Docker Image
docker build -t base-express .

# Run Docker Image
docker run -p 3000:3000 -d base-express
```

## Made With

* Typescript
* Express
* Prisma
* dotenv
* multer
