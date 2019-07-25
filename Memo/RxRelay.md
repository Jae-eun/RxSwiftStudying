# RxRelay

>  **RxRelay**: Provides `PublishRelay` and `BehaviorRelay`.
>
> They behave exactly like their parallel `Subject`s, with two changes:
>
> * Relays never complete.
> * Relays never emit errors.
>
> In essence, Relays only emit `.next` events, and never terminate.
>
> It depends on `RxSwift`.

