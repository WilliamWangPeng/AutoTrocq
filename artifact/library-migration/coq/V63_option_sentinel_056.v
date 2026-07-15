(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_056.
Definition enc_56 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_56 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_56 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_56 : forall o : option nat, dec_56 (enc_56 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_56 : forall o : option nat, enc_56 o = size_56 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_56 : forall o : option nat, enc_56 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_056.

