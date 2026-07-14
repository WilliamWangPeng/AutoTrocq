(* V60 case-study module *)
(* PATTERN: option-to-sentinel *)
(* TRANSFER_SHAPE: section *)

Module V60_OptionSentinel.
Definition enc (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition option_size (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc : forall o : option nat, dec (enc o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer : forall o : option nat, enc o = option_size o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique : forall o : option nat, enc o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V60_OptionSentinel.

