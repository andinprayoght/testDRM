# Gunakan base image resmi Node.js
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy semua file source ke container
COPY . .

# Set environment variable default (bisa di-overwrite saat deploy)
ENV PORT=8787
ENV CLEAR_KEY_ID=6d8181bca994eaa57329e04c98122868
ENV CLEAR_KEY=da9b3e7a19a1430b19047792fc6add67
ENV MPD_URL=https://nodepro.tipiku.biz.id/stream/17875/file/drm/dash/17875_stream.mpd?hdnts=exp=1756741082~acl=/stream/17875/file/*~id=187936370~hmac=da343a00ff435765d7c414fad534ed68e1432648af5156768aaa122fe78aa3ca

# Expose port untuk Cloudflare Worker / Node server
EXPOSE 8787

# Jalankan aplikasi
CMD ["npm", "start"]
