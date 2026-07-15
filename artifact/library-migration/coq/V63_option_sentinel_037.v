(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_037.
Definition enc_37 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_37 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_37 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_37 : forall o : option nat, dec_37 (enc_37 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_37 : forall o : option nat, enc_37 o = size_37 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_37 : forall o : option nat, enc_37 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_037.

