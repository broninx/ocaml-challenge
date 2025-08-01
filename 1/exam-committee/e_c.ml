type vote = StrongReject | WeakReject | WeakAccept | StrongAccept

let decide_exam v0 v1 v2 = match v0,v1,v2 with
| StrongReject,_,_ | _,StrongReject,_ | _,_,StrongReject -> false 
| WeakReject,WeakReject,_ | _,WeakReject,WeakReject | WeakReject,_,WeakReject -> false 
| _,_,_ -> true 
