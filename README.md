# yocto

---

bash scripts for yocto project

---

**quickstart**

```
{
  git clone https://github.com/temptemp3/yocto.git
  bash yocto/test-setup.sh
}
```

---

 + **test-setup.sh** (see <https://www.yoctoproject.org/docs/2.4/yocto-project-qs/yocto-project-qs.html>)
   + install build host packages
       + support for all package management system           
           + initially only using apt-get (Ubuntu and Debian)
           + not yet implemented (see <https://www.yoctoproject.org/docs/2.4/yocto-project-qs/yocto-project-qs.html#packages>)
             + Fedora, OpenSUSE, CentOS
   + create image for emulation
       + using images
           + core-image-minimal *default*
           + core-image-sato
   + run on qemu

---
