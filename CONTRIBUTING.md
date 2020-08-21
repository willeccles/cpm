# Contributing to cpm

To add your package manager to cpm, do the following:

1. Add a function for the package manager. These should be kept in the same
   order as the conditionals at the end of the file.
    - Your function must look and act the same as the others
    - Do not rely on coreutils; if you need to use something from coreutils, you
      should write a shell function to do it. See `tot` and `has`, for example.
    - You must implement **ALL** functionality in your function. If there is a
      package manager for which one cannot be added, state this in your pull
      request and an exception can be made if absolutely necessary.
2. Add a condition at the end of the file to find your package manager, then
   call your function inside the conditional.
3. Test that your function works.
4. Submit a pull request! I usually respond to PRs and issues pretty quickly.
