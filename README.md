# tiny_crawler_assignment
Completion time for step 1 and 2: around ~1h30

## Current State
At the moment the code is written so that it matches the requirements. It was also written in a way would facilitate improvements in the future (they will be described later in the document)

I made a personnal choice to NOT use any external dependencies / libraries outside of what is available from a fresh ruby install.

Otherwise I could have just search for a gem to download the page, its assets and crawl it to find the number of elements to display (nokogiri for example) but it felt like that wasn't the purpose of the assignment.

Also, the current code will NOT work with SPA.

### Code architecture
All of the code is contained within the PageCrawler module defined within the `fetch` executable.

I could have moved it to another file and require it, but I wasn't sure if you wanted to keep everything in a single file or not. Because the code is straight forward I decided to leave it here, but since everything is already contained within that module, moving it is pretty much just creating to file, coping the code, and require the file in the executable.

### Error management
It wasn't clear if we were supposed to interrupt the script of in case exception raising.
In turn I wrapped the whole fatching process within a begin rescue and added a flag (must be changed manually atm) to re raise the error after displaying it on stdout. The code is made so that very little changes are necessary to change the behavior through an option passed during script call

### Performances (Ractor)
We are at the moment iterating over all urls in a synchronous way, but we could add Ractor implementation later (atm not stable if I remember), and since the code is written as much as I could in a funtionnal way, there is no risk of state changes that would causes issues (as long as each ractor matches each url fetch of course).

Then the question is, how do we want to handle excpetions then (do we want to interrupt everythin, do we want the output to be exactly in the same order as the input etc)

### Testing
I did not take the time to write a tests suite for the assignment, to do so would break my original wish to have a dependency free assignment.
Because the code is written in a functionnal way (outside of the option parsing with ARGV) it should be pretty easy to tests.

### Bonus part
Because I spent too much time wondering if I should use third party tools or not, I think I will not have the time to do the bonus part and prefered to write that document and documenting the code instead.

As for how I would do it in a real situation, use a library like nokogiri, parse the html and go through all href, src and things that could be done in CSS, download the assests and rename the urls to point to a local file.
