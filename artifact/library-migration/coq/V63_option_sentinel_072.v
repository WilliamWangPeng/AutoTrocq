(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_072.
Definition enc_72 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_72 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_72 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_72 : forall o : option nat, dec_72 (enc_72 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_72 : forall o : option nat, enc_72 o = size_72 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_72 : forall o : option nat, enc_72 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_072.

