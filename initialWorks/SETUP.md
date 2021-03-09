### 1. Clone 
```sh
$ git clone https://github.com/DIST-projects/cip_2021_bama_ma-am_batch-5010_5018_5125.git
```
### 2. Move to Local Directory
```sh
# This will change directory to a folder cip_2021_bama_ma-am_batch-5010_5018_5125
$ cd cip_2021_bama_ma-am_batch-5010_5018_5125
```
### 3. Create your Own Branch
```sh
#Create branch named "commitsByName". You have to do it once when you create branch initially.
git checkout -b commitsByName

#Move to branch "commitsByName"
git checkout commitsByName

git add filesChanged

git commit -m "Relevant Message"

git push -u origin commitsByName

```

### 4.Sync


Run this to reflect any changes done in the origin main repo in your local repo 
```sh
git fetch origin main
git push origin main
```
